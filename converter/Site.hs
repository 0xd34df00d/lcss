{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE ViewPatterns #-}
{-# LANGUAGE OverloadedStrings #-}

module Site where

import qualified Data.HashMap.Strict as M
import qualified Data.Text as T
import GHC.Generics
import Data.Hashable
import Data.Foldable
import Data.Maybe
import Data.List
import Control.Arrow
import Control.Monad

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
    where pages = M.fromListWith (++) $ map (fixSubtyp . typCat . url &&& return) $ filter ((/= Image) . typ) $ toList ns
          fixSubtyp (Category c ts) = Category c $ ts >>= subtyp c

typCat :: T.Text -> Category
typCat t = fromJust $ msum $ map (uncurry root) roots  ++ [Just $ Category Other []]
    where root r c |  r `T.isPrefixOf` t = Just $ Category c [T.drop (T.length r + 1) t]
                   | otherwise = Nothing
          roots = [("plugins", Plugins), ("user-guide", UserGuide), ("development", Development), ("concepts", Concepts)]

subtyp :: RootCategory -> T.Text -> [T.Text]
subtyp c t | Just ss <- lookup c cs
           , Just s <- find ((`T.isPrefixOf` t) . (`T.snoc` '-')) ss = [s]
           | otherwise = []
    where cs = [(Plugins, ["azoth", "poshuku", "blasq"])]
