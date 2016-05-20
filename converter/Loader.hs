{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE OverloadedStrings #-}

module Loader(processFiles) where

import qualified Data.ByteString.Lazy.Char8 as BS
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

data TagRecord = TagRecord {
        tagNid :: Int,
        tagText :: T.Text
    } deriving (Show, Eq, Ord, Generic)

instance CSV.FromRecord TagRecord

data ImageRecord = ImageRecord {
        imageNid :: Int,
        imagePath :: T.Text
    } deriving (Show, Eq, Ord, Generic)

instance CSV.FromRecord ImageRecord

combine :: V.Vector TagRecord -> V.Vector ImageRecord -> V.Vector NodeRecord -> V.Vector Node
combine = undefined

processFiles :: [BS.ByteString] -> Either String (V.Vector Node)
processFiles [nodesC, tagsC, filesC] = do
    nodes <- CSV.decode CSV.NoHeader nodesC
    tags <- CSV.decode CSV.NoHeader tagsC
    images <- CSV.decode CSV.NoHeader filesC
    return $ combine tags images nodes
