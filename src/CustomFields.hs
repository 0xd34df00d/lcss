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
isCurrentPage fp item = getRoute (itemIdentifier item) >>= compareTemplated fp

isCurrentPageField :: FilePath -> Context a
isCurrentPageField = field "isCurrentPage" . isCurrentPage

getParentPage :: MonadMetadata m => Item a -> m (Maybe String)
getParentPage item = getMetadataField (itemIdentifier item) "parentPage"

isDirectChild :: FilePath -> Item a -> Compiler String
isDirectChild fp item = getParentPage item >>= compareTemplated fp

isDirectChildField :: FilePath -> Context a
isDirectChildField = field "isDirectChild" . isDirectChild

compareTemplated :: (Eq a, Applicative f) => a -> Maybe a -> f String
compareTemplated l r | Just l == r = pure "true"
                     | otherwise = pure "false"
