{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE OverloadedStrings #-}

module Node where

import qualified Data.Text as T
import qualified Data.Csv as CSV(FromField, parseField)
import GHC.Generics
import Control.Monad

data NodeType = Story | Page | Image | Book deriving (Show, Eq, Ord)

instance CSV.FromField NodeType where
    parseField s | s == "story" = pure Story
                 | s == "page" = pure Page
                 | s == "image" = pure Image
                 | s == "book" = pure Book
                 | otherwise = mzero

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
