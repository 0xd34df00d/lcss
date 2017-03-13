module CustomFields
        (
         dates,
         isCurrentPageField,
         isDirectChildField
        ) where

import Data.Monoid
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
