{-# LANGUAGE DeriveGeneric #-}

module Node where

import qualified Data.Text as T
import GHC.Generics

data NodeType = Story | Page | Image | Book deriving (Show, Eq, Ord)

data NodeContents = TextContents {
        teaser :: T.Text,
        body :: T.Text
    }
    | ImageContents {
        imagePath :: T.Text
    } deriving (Show, Eq, Ord, Generic)

data Node = Node {
        nid :: Int,
        typ :: NodeType,
        title :: T.Text,
        timestamp :: Int,
        url :: T.Text,
        tags :: [T.Text],
        contents :: NodeContents
    } deriving (Show, Eq, Ord, Generic)
