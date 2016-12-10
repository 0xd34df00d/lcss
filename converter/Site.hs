{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE ViewPatterns #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE QuasiQuotes #-}
{-# LANGUAGE RecordWildCards #-}

module Site(PagesSet, convertSite) where

import qualified Data.HashMap.Strict as M
import qualified Data.Text as T
import GHC.Generics
import Data.Hashable
import Data.Foldable
import Data.Maybe
import Data.Char
import Control.Arrow
import Data.String.Interpolate.IsString

import Node
import ImageRefExtractor

data RootCategory = Other
        | News
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


data NodeWMetadata = NodeWMetadata {
        node :: Node,
        imageRefs :: [ImageRef]
    } deriving (Show, Eq, Ord)


data Site t = Site {
        pages :: M.HashMap Category [t]
    } deriving (Show, Eq)

instance Functor Site where
    fmap f s = s { pages = (f <$>) <$> pages s }

type PagesSet = [([String], T.Text)]


convertSite :: Foldable t => t Node -> PagesSet
convertSite = toPagesSet . nodes2site


nodes2site :: Foldable t => t Node -> Site NodeWMetadata
nodes2site ns = enrichMetadata ns <$> Site (M.fromListWith (++) $ map (fixSubtyp . nodeCat &&& return) $ filter ((/= Image) . typ) $ toList ns)
    where fixSubtyp (Category c ts) = Category c $ ts >>= subtyp c

enrichMetadata :: Foldable t => t Node -> Node -> NodeWMetadata
enrichMetadata ns = uncurry NodeWMetadata . extractNode ns

nodeCat :: Node -> Category
nodeCat (typ -> Story) = Category News []
nodeCat (url -> t) = fromJust $ msum $ map (uncurry root) roots  ++ [Just $ Category Other []]
    where root r c |  r `T.isPrefixOf` t = Just $ Category c [T.drop (T.length r + 1) t]
                   | otherwise = Nothing
          roots = [("plugins", Plugins), ("user-guide", UserGuide), ("development", Development), ("concepts", Concepts)]

subtyp :: RootCategory -> T.Text -> [T.Text]
subtyp c t | Just ss <- lookup c cs
           , Just s <- find ((`T.isPrefixOf` t) . (`T.snoc` '-')) ss = [s]
           | otherwise = []
    where cs = [(Plugins, ["azoth", "poshuku", "blasq"])]

toPagesSet :: Site NodeWMetadata -> PagesSet
toPagesSet = concatMap catToPagesSet . M.toList . pages

catToPagesSet :: (Category, [NodeWMetadata]) -> PagesSet
catToPagesSet (cat2path -> path, ns) = map (nodePath &&& node2contents) ns
    where nodePath n = path ++ [mkFilename (node n) ++ ".md"]
          mkFilename n | not $ T.null $ url n = T.unpack $ url n
                       | otherwise = "node-" ++ show (nid n)

cat2path :: Category -> [String]
cat2path (Category r s) = map toLower (show r) : map T.unpack s

node2contents :: NodeWMetadata -> T.Text
node2contents NodeWMetadata { node = Node { contents = TextContents { .. }, .. }, .. } = T.strip s
    where s | T.null teaser || teaser == body = [i|
---
title: #{title}
---

#{convert body}
|]
            | otherwise = [i|
---
title: #{title}
---

#{teaser}
#{body}
|]
