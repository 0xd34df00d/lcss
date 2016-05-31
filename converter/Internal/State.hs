{-# LANGUAGE RecordWildCards #-}

module Internal.State where

data ListType = Ordered | Unordered deriving (Eq, Ord, Show)

data ListInfo = ListInfo {
        listType :: ListType,
        listItemNum :: Int
    } deriving (Eq, Ord, Show)

data Break = NoBreak | LineBreak | ParaBreak deriving (Eq, Ord, Show)

data MDState = MDState {
        wantBreak :: Break,
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

nestIntoList :: ListType -> MDState -> MDState
nestIntoList typ st = st { listNestLevel = listNestLevel st + 1, listStack = ListInfo typ 0 : listStack st }

emptyMDState :: MDState
emptyMDState = MDState { wantBreak = NoBreak, listNestLevel = 0, listStack = [] }

requestBreak :: Break -> MDState -> MDState
requestBreak bk st = st { wantBreak = bk }
