module CustomFields
        (
         dates,
         isCurrentPageField,
         isSibling,
         isDirectChild,
         isDirectChildField,
         getBookOrder,
         getBookOrder',
         buildFieldMap
        ) where

import qualified Data.Map.Lazy as M
import Data.Monoid
import Data.Maybe
import Hakyll

date :: Context String
date = dateField "date" "%B %e, %Y"

dateAndTime :: Context String
dateAndTime = dateField "dateandtime" "%B %e, %Y, %H:%M"

dates :: Context String
dates = date <> dateAndTime

isCurrentPage :: FilePath -> Item a -> Compiler String
isCurrentPage fp item = compareTemplated fp <$> getRoute (itemIdentifier item)

isCurrentPageField :: FilePath -> Context a
isCurrentPageField = field "isCurrentPage" . isCurrentPage

getParentPage :: MonadMetadata m => Item a -> m (Maybe String)
getParentPage item = getMetadataField (itemIdentifier item) "parentPage"

isSibling :: MonadMetadata m => Maybe String -> Item a -> m Bool
isSibling str item = (== str) <$> getParentPage item

isDirectChild :: MonadMetadata m => FilePath -> Item a -> m Bool
isDirectChild fp item = compareMaybe fp <$> getParentPage item

isDirectChildField :: FilePath -> Context a
isDirectChildField = field "isDirectChild" . val
    where val fp item = boolToTemplated <$> isDirectChild fp item

compareMaybe :: Eq a => a -> Maybe a -> Bool
compareMaybe l r = Just l == r

boolToTemplated :: Bool -> String
boolToTemplated True = "true"
boolToTemplated False = "false"

compareTemplated :: Eq a => a -> Maybe a -> String
compareTemplated = (boolToTemplated .) . compareMaybe

getBookOrder :: MonadMetadata m => Item a -> m (Maybe Int)
getBookOrder item = (read <$>) <$> getMetadataField (itemIdentifier item) "bookOrder"

getBookOrder' :: MonadMetadata m => Int -> Item a -> m Int
getBookOrder' def = fmap (fromMaybe def) . getBookOrder

buildFieldMap :: MonadMetadata m => String -> [Item a] -> m (M.Map Identifier (Maybe String))
buildFieldMap fld items = do
    let ids = itemIdentifier <$> items
    vals <- mapM (`getMetadataField` fld) ids
    pure $ M.fromList $ zip ids vals
