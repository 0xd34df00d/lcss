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

isDirectChild :: MonadMetadata m => FilePath -> Item a -> m String
isDirectChild fp item = compareTemplated fp <$> getParentPage item

isDirectChildField :: FilePath -> Context a
isDirectChildField = field "isDirectChild" . isDirectChild

compareTemplated :: Eq a => a -> Maybe a -> String
compareTemplated l r | Just l == r = "true"
                     | otherwise = "false"
