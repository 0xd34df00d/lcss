{-# LANGUAGE PartialTypeSignatures #-}

module Html2Markdown where

import qualified Data.Text as T
import qualified Text.HTML.TagSoup as TS
import qualified Text.HTML.TagSoup.Tree as TS.T
import Data.Char
import Data.Maybe

convert :: T.Text -> _ 
convert = --mconcat . map toMd .
            cleanupHtml . TS.T.parseTree

cleanupHtml :: [TS.T.TagTree T.Text] -> [TS.T.TagTree T.Text]
cleanupHtml = TS.T.transformTree removeEmpty

removeEmpty :: TS.T.TagTree T.Text -> [TS.T.TagTree T.Text]
removeEmpty (TS.T.TagLeaf (TS.TagText t)) | T.all isSpace t = []
removeEmpty (TS.T.TagBranch n _ []) | n /= "br" = []
removeEmpty t = [t]

toMd :: TS.T.TagTree T.Text -> T.Text
toMd (TS.T.TagLeaf (TS.TagText t)) = t
toMd (TS.T.TagBranch "strong" [] cs) = mconcat $ "*" : map toMd cs ++ ["*"]
toMd (TS.T.TagBranch "br" [] []) = "\n"
toMd t = TS.T.renderTree [t]
