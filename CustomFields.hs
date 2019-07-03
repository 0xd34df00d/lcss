{-# LANGUAGE FlexibleInstances #-}

module CustomFields
( HasMetadata(..)
, dates
, isCurrentPageField
, isSibling
, isDirectChild
, getParentPage
, isKeyPlugin
, getBookOrder
, getBookOrder'
, buildFieldMap
) where

import qualified Data.Map.Lazy as M
import Data.Maybe
import Hakyll

date :: Context String
date = dateField "date" "%B %e, %Y"

dateAndTime :: Context String
dateAndTime = dateField "dateandtime" "%B %e, %Y, %H:%M"

dates :: Context String
dates = date <> dateAndTime

class HasMetadata a where
  (/>) :: MonadMetadata m => a -> String -> m (Maybe String)
  ident :: a -> Identifier

instance HasMetadata (Item a) where
  (/>) = getMetadataField . itemIdentifier
  ident = itemIdentifier

instance HasMetadata (Identifier, Metadata) where
  (_, m) /> f = pure $ lookupString f m
  ident = fst

isCurrentPage :: HasMetadata a => FilePath -> a -> Compiler String
isCurrentPage fp a = compareTemplated fp <$> getRoute (ident a)

isCurrentPageField :: FilePath -> Context a
isCurrentPageField = field "isCurrentPage" . isCurrentPage

getParentPage :: (HasMetadata a, MonadMetadata m) => a -> m (Maybe String)
getParentPage a = a /> "parentPage"

isSibling :: (HasMetadata a, MonadMetadata m) => Maybe String -> a -> m Bool
isSibling str a = (== str) <$> getParentPage a

isDirectChild :: (HasMetadata a, MonadMetadata m) => FilePath -> a -> m Bool
isDirectChild fp item = compareMaybe fp <$> getParentPage item

isKeyPlugin :: (HasMetadata a, MonadMetadata m) => a -> m Bool
isKeyPlugin a = compareMaybe "1" <$> a /> "keyplugin"

compareMaybe :: Eq a => a -> Maybe a -> Bool
compareMaybe l r = Just l == r

boolToTemplated :: Bool -> String
boolToTemplated True = "true"
boolToTemplated False = "false"

compareTemplated :: Eq a => a -> Maybe a -> String
compareTemplated = (boolToTemplated .) . compareMaybe

getBookOrder :: (HasMetadata a, MonadMetadata m) => a -> m (Maybe Int)
getBookOrder a = (read <$>) <$> a /> "bookOrder"

getBookOrder' :: (HasMetadata a, MonadMetadata m) => Int -> a -> m Int
getBookOrder' def = fmap (fromMaybe def) . getBookOrder

buildFieldMap :: (HasMetadata a, MonadMetadata m) => String -> [a] -> m (M.Map Identifier (Maybe String))
buildFieldMap fld as = do
  let ids = ident <$> as
  vals <- mapM (/> fld) as
  pure $ M.fromList $ zip ids vals
