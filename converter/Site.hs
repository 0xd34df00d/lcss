{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE ViewPatterns #-}
{-# LANGUAGE OverloadedStrings #-}

module Site where

import qualified Data.HashMap.Strict as M
import qualified Data.Text as T
import GHC.Generics
import Data.Hashable
import Data.Foldable
import Control.Arrow

import Node

data RootCategory = Other
        | Plugins
        | UserGuide
        | Development
        | Concepts
        deriving (Show, Eq, Ord, Generic)

instance Hashable RootCategory

data Category = Category {
        rootCat :: RootCategory,
        hier :: [T.Text]
    } deriving (Show, Eq, Ord, Generic)

instance Hashable Category

justRoot :: RootCategory -> Category
justRoot = flip Category []

data Site t = Site {
        pages :: M.HashMap Category [t]
    } deriving (Show, Eq)

instance Functor Site where
    fmap f s = s { pages = (f <$>) <$> pages s }


nodes2site :: Foldable t => t Node -> Site Node
nodes2site ns = Site pages
    where pages = M.fromListWith (++) $ map (justRoot . nodeCat &&& return) $ filter ((/= Image) . typ) $ toList ns

typCat :: T.Text -> Maybe RootCategory
typCat "plugins" = Just Plugins
typCat "user-guide" = Just UserGuide
typCat "development" = Just Development
typCat "concepts" = Just Concepts
typCat _ = Nothing

nodeCat :: Node -> RootCategory
nodeCat (typCat . url -> Just c) = c
nodeCat _ = Other
