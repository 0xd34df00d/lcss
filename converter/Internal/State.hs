{-# LANGUAGE RecordWildCards #-}

module Internal.State where

data ListType = Ordered | Unordered deriving (Eq, Ord, Show)

data ListInfo = ListInfo {
        listType :: ListType,
        listItemNum :: Int
    } deriving (Eq, Ord, Show)

data MDState = MDState {
        wantBreak :: Bool,
        listNestLevel :: Int,
        listStack :: [ListInfo]
    } deriving (Eq, Ord, Show)

incListItemNum :: MDState -> MDState
incListItemNum st@MDState { listStack = h : rest, .. } = st { listStack = h' : rest }
    where h' = h { listItemNum = listItemNum h + 1 }

curListType :: MDState -> ListType
curListType = listType . head . listStack

curListItem :: MDState -> Int
curListItem = listItemNum . head . listStack

emptyMDState :: MDState
emptyMDState = MDState { wantBreak = False, listNestLevel = 0, listStack = [] }
