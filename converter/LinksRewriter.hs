{-# LANGUAGE QuasiQuotes #-}

module LinksRewriter where

import qualified Data.HashMap.Strict as M
import Text.Regex
import Data.List
import Data.Monoid
import Control.Arrow
import Data.String.Interpolate

import Node

rewriteLinks :: M.HashMap Int Node -> String -> String
rewriteLinks nodes = concatMap (uncurry (<>)) . (second (fixLink nodes) <$>) . extractLinks

fixLink :: M.HashMap Int Node -> String -> String
fixLink _ [] = []
fixLink nodes s = [i|<a href="/#{url'}">#{drop 2 rest}</a>|]
    where (nid', rest) = break (== ':') $ init $ tail s
          url' | Just node <- M.lookup (read nid') nodes = url node 
               | otherwise = error $ "Cannot find key: " <> nid'

extractLinks :: String -> [(String, String)]
extractLinks = unfoldr f
    where f [] = Nothing
          f s | Just (pre, match, rest, _) <- matchRegexAll rx s = Just ((pre, match), rest)
              | otherwise = Just ((s, ""), "")
          rx = mkRegex "\\[[0-9]*: [^]]*\\]"
