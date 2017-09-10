--------------------------------------------------------------------------------
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE RankNTypes #-}
{-# LANGUAGE ParallelListComp #-}
import           Data.Monoid
import           Hakyll

import qualified Data.Map.Lazy as M
import Data.List.Extra
import Data.Char
import Data.Maybe
import Control.Monad
import Control.Monad.ListM

import ImageRefsCompiler
import CustomFields


--------------------------------------------------------------------------------
main :: IO ()
main = hakyll $ do
    match "images/*" $ do
        route   idRoute
        compile copyFileCompiler

    match "css/*" $ do
        route   idRoute
        compile compressCssCompiler

    match "text/*.md" $ do
        route $ customRoute $ dropPrefix "text/" . unmdize . toFilePath
        compile $ pandocCompiler
                >>= loadAndApplyTemplate "templates/default.html" defaultContext
                >>= relativizeUrls
                >>= imageRefsCompiler

    listed (defListedConfig "plugins") {
                                        createRoot = CustomRoot pluginsRoot,
                                        listTemplate = "plugins",
                                        customTemplate = Just "book-item",
                                        customItemsContext = sectionsContext sortBookOrder "plugins"
                                       }

    listed (defListedConfig "news") {
                                     customContext = dates,
                                     customTemplate = Just "news-item",
                                     subOrder = recentFirst,
                                     verPreprocess = False
                                    }

    listed (defListedConfig "concepts") { verPreprocess = False }

    listed (defListedConfig "development") {
                                            createRoot = NoRoot,
                                            customTemplate = Just "book-item",
                                            customItemsContext = sectionsContext sortBookOrder "development"
                                           }

    listed (defListedConfig "userguide") {
                                           createRoot = NoRoot,
                                           customTemplate = Just "book-item",
                                           customItemsContext = sectionsContext sortBookOrder "userguide"
                                         }

    match "templates/*" $ compile templateBodyCompiler

--------------------------------------------------------------------------------

type CustomRootBuilder = ListedConfig -> Pattern -> Context String -> (String -> Identifier) -> Rules ()

data RootItem = NoRoot
              | DefaultRoot
              | CustomRoot CustomRootBuilder

data ListedConfig = ListedConfig {
                        section :: String,
                        customTemplate :: Maybe String,
                        customContext :: Context String,
                        customItemsContext :: Compiler (Context String),
                        listTitle :: String,
                        listFieldName :: String,
                        listTemplate :: String,
                        createRoot :: RootItem,
                        verPreprocess :: Bool,
                        subOrder :: forall m a. MonadMetadata m => [Item a] -> m [Item a]
                    }

defListedConfig :: String -> ListedConfig
defListedConfig section = ListedConfig {
                              section = section,
                              customTemplate = Nothing,
                              customContext = mempty,
                              customItemsContext = pure mempty,
                              listTitle = toUpper (head section) : tail section,
                              listFieldName = section,
                              listTemplate = section,
                              createRoot = DefaultRoot,
                              verPreprocess = True,
                              subOrder = pure
                          }

pluginsRoot :: CustomRootBuilder
pluginsRoot ListedConfig { .. } filesPat ctx tplPath = create [fromFilePath section] $ do
    route idRoute
    compile $ do
        allItems <- loadAll (filesPat .&&. hasNoVersion) >>= subOrder
        keyItems <- filterM isKeyPlugin allItems
        otherItems <- filterM otherPred allItems
        let itemChildren item = filterM (isDirectChild $ bareName item) allItems
        children <- do
            chs <- mapM (itemChildren) keyItems
            pure $ M.fromList [(defaultTextRoute $ itemIdentifier item, chs') | item <- keyItems
                                                                              | chs' <- chs]
        let subsCtx = listFieldWith "subplugins" ctx (\item -> pure $ children M.! bareName item)
                    <> boolField "hasSubplugins" (\item -> not $ null $ children M.! bareName item)
                    <> field "bareName" (pure . bareName)
        let listCtx = mconcat
                        [
                         listField "keyplugins" (subsCtx <> ctx) $ pure keyItems,
                         listField "otherplugins" ctx $ pure otherItems,
                         ctx
                        ]
        makeItem ""
            >>= loadAndApplyTemplate (tplPath listTemplate) listCtx
            >>= loadAndApplyTemplate "templates/default.html" listCtx
            >>= relativizeUrls
    where otherPred item = do
            isKey <- isKeyPlugin item
            parent <- getParentPage item
            pure $ not isKey && isNothing parent
          bareName = defaultTextRoute . itemIdentifier

listed :: ListedConfig -> Rules ()
listed cfg@ListedConfig { .. } = do
    when verPreprocess $
        match filesPat $ version "preprocess" $ do
            route $ customRoute defaultTextRoute
            compile getResourceBody

    match filesPat $ do
        route $ customRoute defaultTextRoute
        compile $ do
            ctx' <- customItemsContext
            pandocCompiler
                  >>= loadAndApplyCustom (ctx' <> ctx)
                  >>= loadAndApplyTemplate "templates/default.html" (ctx' <> ctx)
                  >>= relativizeUrls
                  >>= imageRefsCompiler

    case createRoot of
        NoRoot -> pure ()
        DefaultRoot -> create [fromFilePath section] $ do
            route idRoute
            compile $ do
                items <- loadAll (filesPat .&&. hasNoVersion) >>= subOrder
                let listCtx = constField "title" listTitle <> listField listFieldName ctx (pure items) <> ctx
                makeItem ""
                    >>= loadAndApplyTemplate (tplPath listTemplate) listCtx
                    >>= loadAndApplyTemplate "templates/default.html" listCtx
                    >>= relativizeUrls
        CustomRoot rules -> rules cfg filesPat ctx tplPath

    where filesPat = fromGlob $ "text/" <> section <> "/*.md"
          ctx = customContext <> defaultContext
          tplPath path = fromFilePath $ "templates/" <> path <> ".html"
          loadAndApplyCustom | Just tpl <- customTemplate = loadAndApplyTemplate (tplPath tpl)
                             | otherwise = const pure

defaultTextRoute :: Identifier -> FilePath
defaultTextRoute = snd . breakEnd (== '/') . unmdize . toFilePath

loadCurrentPath :: Compiler FilePath
loadCurrentPath = defaultTextRoute . fromFilePath . drop 2 <$> getResourceFilePath

sectionsContext :: Sorter -> String -> Compiler (Context a)
sectionsContext sorter sectName = do
    fp <- loadCurrentPath
    thisItem <- getResourceBody
    thisParent <- getMetadataField (itemIdentifier thisItem) "parentPage"
    allItems <- loadAll (fromGlob ("text/" <> sectName <> "/*.md") .&&. hasVersion "preprocess") >>= sorter
    siblings <- filterM (isSibling thisParent) allItems
    children <- filterM (isDirectChild fp) allItems
    shortDescrs <- buildFieldMap "shortdescr" children
    let hasShortDescr = boolField "hasShortDescr" $ isJust . join . (`M.lookup` shortDescrs) . itemIdentifier
    pure $ mconcat
            [
             listField "siblingSections" (isCurrentPageField fp <> defaultContext) (pure siblings),
             hasPagesField "hasSiblingSections" siblings,
             listField "childSections" (hasShortDescr <> defaultContext) (pure children),
             hasPagesField "hasChildSections" children
            ]
    where hasPagesField name = boolField name . const . not . null

unmdize :: String -> String
unmdize s = take (length s - 3) s

dropPrefix :: String -> String -> String
dropPrefix s = drop $ length s

sortItemsBy :: (MonadMetadata m, Ord b) => (Item a -> m b) -> [Item a] -> m [Item a]
sortItemsBy = sortByM . comparingM
    where comparingM f a b = compare <$> f a <*> f b

type Sorter = forall m a. MonadMetadata m => [Item a] -> m [Item a]

sortBookOrder :: Sorter
sortBookOrder = sortItemsBy $ getBookOrder' 0
