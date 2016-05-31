{-# LANGUAGE PartialTypeSignatures #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE ViewPatterns #-}
{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE RecordWildCards #-}

module Html2Markdown where

import qualified Data.Text as T
import qualified Data.Text.Read as TR
import qualified Text.HTML.TagSoup as TS
import qualified Text.HTML.TagSoup.Tree as TS.T
import Data.Monoid
import Data.Char
import Data.Maybe
import Control.Arrow
import Control.Monad.State

import Internal.State

convert :: T.Text -> T.Text
convert = mconcat . map toMd . cleanupHtml . TS.T.parseTree

cleanupHtml :: [TS.T.TagTree T.Text] -> [TS.T.TagTree T.Text]
cleanupHtml = TS.T.transformTree removeEmpty

removeEmpty :: TS.T.TagTree T.Text -> [TS.T.TagTree T.Text]
removeEmpty (TS.T.TagLeaf (TS.TagText t)) | T.all isSpace t = []
removeEmpty (TS.T.TagBranch n _ []) | n /= "br" = []
removeEmpty t = [t]

wrapChildren :: MonadState MDState m => T.Text -> [TS.T.TagTree T.Text] -> m T.Text
wrapChildren m cs = do
    texts <- mapM toMd' cs
    return $ m <> mconcat texts <> m

prepChildren :: MonadState MDState m => T.Text -> [TS.T.TagTree T.Text] -> m T.Text
prepChildren m cs = do
    texts <- mapM toMd' cs
    return $ m <> mconcat texts

singleLine :: T.Text -> T.Text
singleLine t | T.last t == '\n' = t
             | otherwise = t `T.snoc` '\n'

toMd :: TS.T.TagTree T.Text -> T.Text
toMd t = evalState (toMd' t) emptyMDState

parseListType :: T.Text -> Maybe ListType
parseListType "ul" = Just Unordered
parseListType "ol" = Just Ordered
parseListType _ = Nothing

withBreak :: MonadState MDState m => m T.Text -> m T.Text
withBreak s = do
    br <- gets wantBreak
    modify (\st -> st { wantBreak = NoBreak })
    t <- s
    return $ wrap br t
    where wrap NoBreak t = t
          wrap LineBreak (T.stripSuffix "\n" -> Just t) = t <> "\n"
          wrap LineBreak t = t <> "\n"
          wrap ParaBreak (T.stripSuffix "\n\n" -> Just t) = t <> "\n\n"
          wrap ParaBreak (T.stripSuffix "\n" -> Just t) = t <> "\n\n"
          wrap ParaBreak t = t <> "\n\n"

toMd' :: MonadState MDState m => TS.T.TagTree T.Text -> m T.Text
toMd' (TS.T.TagLeaf (TS.TagText t)) = return t
toMd' (TS.T.TagBranch "strong" [] cs) = wrapChildren "**" cs
toMd' (TS.T.TagBranch "b" [] cs) = wrapChildren "**" cs
toMd' (TS.T.TagBranch "em" [] cs) = wrapChildren "_" cs
toMd' (TS.T.TagBranch "i" [] cs) = wrapChildren "_" cs
toMd' (TS.T.TagBranch (parseListType -> Just typ) [] cs) = do
    st <- get
    put $ st { listNestLevel = listNestLevel st + 1, listStack = ListInfo typ 0 : listStack st }
    r <- mapM toMd' cs
    put st
    return $ T.intercalate "\n" r
toMd' (TS.T.TagBranch "li" [] cs) = do
    st <- incListItemNum <$> get
    put st
    texts <- mapM toMd' cs
    let pretext | not (null cs) && isList (head cs) = T.empty
                | otherwise = T.replicate (2 * (listNestLevel st - 1)) " " <> type2sym (curListItem st) (curListType st) <> " "
            where isList (TS.T.TagBranch (parseListType -> Just _) _ _) = True
                  isList _ = False
    return $ pretext <> mconcat texts
    where type2sym _ Unordered = "*"
          type2sym n Ordered = T.pack $ show n
toMd' (TS.T.TagBranch (second TR.decimal . T.splitAt 1 -> ("h", Right (n, ""))) [] cs) = singleLine <$> prepChildren ('\n' `T.cons` T.replicate n "#" `T.snoc` ' ') cs
toMd' (TS.T.TagBranch "br" [] []) = return "\n"
toMd' (TS.T.TagBranch n attrs cs) | null cs = return tmpl
                                  | T.count "<" tmpl /= 2 = error "Nowhere to insert the children"
                                  | (h, t) <- T.breakOnEnd "<" tmpl = do
                                        texts <- mapM toMd' cs
                                        return $ T.init h <> mconcat texts <> (T.last h `T.cons` t)
    where tmpl = TS.T.renderTree [TS.T.TagBranch n attrs []]
toMd' t = return $ TS.T.renderTree [t]
