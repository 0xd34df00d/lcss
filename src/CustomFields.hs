module CustomFields where

import Data.Monoid
import Hakyll

date :: Context String
date = dateField "date" "%B %e, %Y"

dateAndTime :: Context String
dateAndTime = dateField "dateandtime" "%B %e, %Y, %H:%M"

dates :: Context String
dates = date <> dateAndTime

isCurrentPage :: FilePath -> Item a -> Compiler String
isCurrentPage fp item = do
    rt <- getRoute $ itemIdentifier item
    pure $ if rt == Just fp
            then "true"
            else "false"

isCurrentPageField :: FilePath -> Context a
isCurrentPageField = field "isCurrentPage" . isCurrentPage

getParentPage :: Item a -> Compiler (Maybe String)
getParentPage item = getMetadataField (itemIdentifier item) "parentPage"

isDirectChild :: FilePath -> Item a -> Compiler String
isDirectChild fp item = do
    parent <- getParentPage item
    pure $ if parent == Just fp
            then "true"
            else "false"

isDirectChildField :: FilePath -> Context a
isDirectChildField = field "isDirectChild" . isDirectChild
