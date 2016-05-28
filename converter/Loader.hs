{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RecordWildCards #-}

module Loader(processFiles) where

import qualified Data.ByteString.Lazy.Char8 as BS
import qualified Data.HashMap.Strict as M
import qualified Data.Vector as V
import qualified Data.Text as T
import qualified Data.Csv as CSV
import GHC.Generics

import Node

data NodeRecord = NodeRecord {
        nid :: Int,
        typ :: NodeType,
        title :: T.Text,
        timestamp :: Int,
        url :: T.Text,
        teaser :: T.Text,
        body :: T.Text
    } deriving (Show, Eq, Ord, Generic)

instance CSV.FromRecord NodeRecord

data TagRecord = TagRecord Int T.Text
    deriving (Show, Eq, Ord, Generic)

instance CSV.FromRecord TagRecord

data ImageRecord = ImageRecord Int T.Text
    deriving (Show, Eq, Ord, Generic)

instance CSV.FromRecord ImageRecord

combine :: V.Vector TagRecord -> V.Vector ImageRecord -> V.Vector NodeRecord -> V.Vector Node
combine tags images = V.map $ csingle tm im
    where tm = M.fromListWith (++) $ map (\(TagRecord n t) -> (n, [t])) $ V.toList tags
          im = M.fromListWith (const $ const "Image map collision") $ map (\(ImageRecord n p) -> (n, p)) $ V.toList images

csingle :: M.HashMap Int [T.Text] -> M.HashMap Int T.Text -> NodeRecord -> Node
csingle tags images NodeRecord { .. } = Node { tags = M.lookupDefault [] nid tags, contents = cnt typ, .. }
    where cnt Image | Just path <- M.lookup nid images = ImageContents path
                    | otherwise = error $ "No image file for image " ++ show nid
          cnt _ = TextContents { .. }

processFiles :: [BS.ByteString] -> Either String (V.Vector Node)
processFiles [nodesC, tagsC, filesC] = do
    nodes <- CSV.decode CSV.NoHeader nodesC
    tags <- CSV.decode CSV.NoHeader tagsC
    images <- CSV.decode CSV.NoHeader filesC
    return $ combine tags images nodes
processFiles _ = Left "Incorrect number of arguments"
