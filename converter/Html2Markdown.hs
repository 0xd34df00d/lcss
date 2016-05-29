{-# LANGUAGE PartialTypeSignatures #-}
{-# LANGUAGE OverloadedStrings #-}

module Html2Markdown where

import qualified Data.Text as T
import qualified Text.HTML.TagSoup as TS
import qualified Text.HTML.TagSoup.Tree as TS.T
import Data.Monoid
import Data.Char
import Data.Maybe

convert :: T.Text -> _ 
convert = mconcat . map toMd . cleanupHtml . TS.T.parseTree

cleanupHtml :: [TS.T.TagTree T.Text] -> [TS.T.TagTree T.Text]
cleanupHtml = TS.T.transformTree removeEmpty

removeEmpty :: TS.T.TagTree T.Text -> [TS.T.TagTree T.Text]
removeEmpty (TS.T.TagLeaf (TS.TagText t)) | T.all isSpace t = []
removeEmpty (TS.T.TagBranch n _ []) | n /= "br" = []
removeEmpty t = [t]

wrapChildren :: T.Text -> [TS.T.TagTree T.Text] -> T.Text
wrapChildren m cs = mconcat $ m : map toMd cs ++ [m]

toMd :: TS.T.TagTree T.Text -> T.Text
toMd (TS.T.TagLeaf (TS.TagText t)) = t
toMd (TS.T.TagBranch "strong" [] cs) = wrapChildren "*" cs
toMd (TS.T.TagBranch "b" [] cs) = wrapChildren "*" cs
toMd (TS.T.TagBranch "em" [] cs) = wrapChildren "_" cs
toMd (TS.T.TagBranch "i" [] cs) = wrapChildren "_" cs
toMd (TS.T.TagBranch "br" [] []) = "\n"
toMd (TS.T.TagBranch n attrs cs) | null cs = tmpl
                                 | T.count "<" tmpl /= 2 = error "Nowhere to insert the children" 
                                 | (h, t) <- T.breakOnEnd "<" tmpl = T.init h <> (mconcat $ map toMd cs) <> (T.last h `T.cons` t)
    where tmpl = TS.T.renderTree [TS.T.TagBranch n attrs []]
toMd t = TS.T.renderTree [t]
