{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE ViewPatterns #-}
{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE QuasiQuotes #-}

module ImageRefExtractor(
        ImageRef,
        extractImageRefs
    ) where

import qualified Data.Text as T
import qualified Data.Text.Read as TR
import qualified Data.IntMap as IM
import qualified Data.HashMap.Lazy as M
import Control.Arrow
import Data.Maybe
import Data.Monoid
import Data.List
import Data.List.Extra
import Data.Foldable
import Data.String.Interpolate.IsString

import Node

data ImageAlign = AlignLeft | AlignRight | AlignInline deriving (Eq, Ord, Show)

data ImageRef = ImageRef {
        refAlign :: ImageAlign,
        refNid :: Int,
        refTitle :: Maybe T.Text,
        refSize :: Maybe (Int, Int)
    } deriving (Eq, Ord, Show)

extractImageRefs :: Foldable t => t Node -> Node -> (Node, [ImageRef])
extractImageRefs ns n@(contents -> TextContents t b) | nid n == 3 = (n { contents = TextContents t' b' }, nubOrd $ trefs ++ brefs)
    where (t', trefs) = extract ns t
          (b', brefs) = extract ns b
extractImageRefs _ n = (n, [])

extract :: Foldable t => t Node -> T.Text -> (T.Text, [ImageRef])
extract (buildNodeMap -> ns) t = mapAccumL (\acc -> first (acc <>) . extractChunk ns) h rest
    where (h:rest) = T.splitOn "[img_assist|" t

imageRef :: M.HashMap T.Text T.Text -> ImageRef
imageRef flags = ImageRef (typ $ M.lookup "align" flags) (readInt $ flags M.! "nid") title size
    where typ (Just "inline") = AlignInline
          typ (Just "right") = AlignRight
          typ (Just "left") = AlignLeft
          typ (Just "none") = AlignInline
          typ Nothing = AlignInline
          typ (Just t) = error $ "Unknown align: " ++ T.unpack t
          title = do
                v <- M.lookup "title" flags
                if T.null v then Nothing else return v
          size = do
                w <- M.lookup "width" flags
                h <- M.lookup "height" flags
                return (readInt w, readInt h)

readInt :: T.Text -> Int
readInt (TR.decimal -> Right (n, _)) = n
readInt t = error $ "Cannot read text as integer: " ++ T.unpack t

extractChunk :: IM.IntMap Node -> T.Text -> (T.Text, ImageRef)
extractChunk imgs t = (ref2text imgs ref <> rest, ref)
    where (ref, rest) = (imageRef . parseAssist) *** T.tail $ T.breakOn "]" t

ref2text :: IM.IntMap Node -> ImageRef -> T.Text
ref2text nodes ImageRef { .. } = [i|<img src="#{imagePath'}" alt="#{title'}" title="#{title'}" style="#{style refAlign}" #{dims} />|]
    where title' = fromMaybe T.empty refTitle
          dims | Just (w, h) <- refSize = [i|width=#{T.pack $ show w} height=#{T.pack $ show h}|]
               | otherwise = T.empty
          style AlignInline = T.empty
          style AlignRight = "float:right"
          style AlignLeft = "float:left"
          Node { contents = ImageContents { .. }, .. } = nodes IM.! refNid
          imagePath' = fromMaybe imagePath $ T.stripPrefix "sites/default/files/" imagePath

buildNodeMap :: Foldable t => t Node -> IM.IntMap Node
buildNodeMap = IM.fromList . map (\n -> (nid n, n)) . filter ((== Image) . typ) . toList

parseAssist :: T.Text -> M.HashMap T.Text T.Text
parseAssist = M.fromList . map (second T.tail . T.breakOn "=") . T.splitOn "|"
