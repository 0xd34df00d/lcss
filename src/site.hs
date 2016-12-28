--------------------------------------------------------------------------------
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RecordWildCards #-}
import           Data.Monoid
import           Hakyll

import Data.List.Extra
import Data.Char
import ImageRefsCompiler


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

    match ("text/plugins/*.md" .||. "text/plugins/*/*.md") $ version "preprocess" $ do
        route $ customRoute defaultTextRoute
        compile $ getResourceBody

    match ("text/plugins/*.md" .||. "text/plugins/*/*.md") $ do
        route $ customRoute defaultTextRoute
        compile $ do
                fp <- defaultTextRoute . fromFilePath . drop 2 <$> getResourceFilePath
                let ctx = pluginsCtx PluginsCtxConfig { isPrep = True, pluginFields = [isCurrentPageField fp] }
                pandocCompiler
                    >>= loadAndApplyTemplate "templates/plugin.html" ctx
                    >>= loadAndApplyTemplate "templates/default.html" ctx
                    >>= relativizeUrls
                    >>= imageRefsCompiler

    create ["plugins"] $ do
        route idRoute
        compile $ do
            let pluginsCtx' = constField "title" "Plugins" <> pluginsCtx PluginsCtxConfig { isPrep = False, pluginFields = [] }
            makeItem ""
                >>= loadAndApplyTemplate "templates/plugins.html" pluginsCtx'
                >>= loadAndApplyTemplate "templates/default.html" pluginsCtx'
                >>= relativizeUrls

    match "text/news/*.md" $ do
        route $ customRoute defaultTextRoute
        let newsCtx = dates <> defaultContext
        compile $ pandocCompiler
                  >>= loadAndApplyTemplate "templates/news-item.html" newsCtx
                  >>= loadAndApplyTemplate "templates/default.html" newsCtx
                  >>= relativizeUrls
                  >>= imageRefsCompiler

    create ["news"] $ do
        route idRoute
        compile $ do
            items <- recentFirst =<< loadAll "text/news/*.md"
            let newsCtx = constField "title" "News" <> listField "news" (dates <> defaultContext) (pure items) <> date <> defaultContext
            makeItem ""
                >>= loadAndApplyTemplate "templates/news.html" newsCtx
                >>= loadAndApplyTemplate "templates/default.html" newsCtx
                >>= relativizeUrls

    match "text/concepts/*.md" $ do
        route $ customRoute defaultTextRoute
        compile $ pandocCompiler
                  >>= loadAndApplyTemplate "templates/default.html" defaultContext
                  >>= relativizeUrls
                  >>= imageRefsCompiler

    create ["concepts"] $ do
        route idRoute
        compile $ do
            items <- loadAll "text/concepts/*.md"
            let conceptsCtx = constField "title" "Concepts" <> listField "concepts" defaultContext (pure items) <> defaultContext
            makeItem ""
                >>= loadAndApplyTemplate "templates/concepts.html" conceptsCtx
                >>= loadAndApplyTemplate "templates/default.html" conceptsCtx
                >>= relativizeUrls

    match "templates/*" $ compile templateBodyCompiler

unmdize :: String -> String
unmdize s = take (length s - 3) s

dropPrefix :: String -> String -> String
dropPrefix s = drop $ length s

--------------------------------------------------------------------------------

data ListedConfig = ListedConfig {
                        section :: String,
                        customTemplate :: Maybe Identifier,
                        customContext :: Context String,
                        listTitle :: String,
                        listFieldName :: String,
                        listTemplate :: String
                    }

defListedConfig :: String -> ListedConfig
defListedConfig section = ListedConfig {
                                section = section,
                                customTemplate = Nothing,
                                customContext = mempty,
                                listTitle = section',
                                listFieldName = section,
                                listTemplate = section
                            }
    where section' = toUpper (head section) : tail section

listed :: ListedConfig -> Rules ()
listed ListedConfig { .. } = do
    match filesPat $ do
        route $ customRoute defaultTextRoute
        compile $ pandocCompiler
                  >>= loadAndApplyCustom
                  >>= loadAndApplyTemplate "templates/default.html" ctx
                  >>= relativizeUrls
                  >>= imageRefsCompiler

    create [fromFilePath section] $ do
        route idRoute
        compile $ do
            items <- loadAll filesPat
            let listCtx = constField "title" listTitle <> listField listFieldName ctx (pure items) <> ctx
            makeItem ""
                >>= loadAndApplyTemplate (fromFilePath $ "templates/" <> listTemplate <> ".html") listCtx
                >>= loadAndApplyTemplate "templates/default.html" listCtx
                >>= relativizeUrls
    where filesPat = fromGlob $ "text/" <> section <> "/*.md"
          ctx = customContext <> defaultContext
          loadAndApplyCustom | Just tpl <- customTemplate = loadAndApplyTemplate tpl ctx
                             | otherwise = pure

date :: Context String
date = dateField "date" "%B %e, %Y"

dateAndTime :: Context String
dateAndTime = dateField "dateandtime" "%B %e, %Y, %H:%M"

dates :: Context String
dates = date <> dateAndTime

data PluginsCtxConfig = PluginsCtxConfig {
                            isPrep :: Bool,
                            pluginFields :: [Context String]
                        }

pluginsCtx :: PluginsCtxConfig -> Context String
pluginsCtx PluginsCtxConfig { .. } = listField "plugins" (mconcat pluginFields <> defaultContext) (loadAll $ "text/plugins/*.md" .&&. verPred) <> defaultContext
    where verPred | isPrep = hasVersion "preprocess"
                  | otherwise = hasNoVersion

isCurrentPage :: FilePath -> Item a -> Compiler String
isCurrentPage fp item = do
        rt <- getRoute $ itemIdentifier item
        pure $ if rt == Just fp
                then "true"
                else "false"

isCurrentPageField :: FilePath -> Context a
isCurrentPageField = field "isCurrentPage" . isCurrentPage

defaultTextRoute :: Identifier -> FilePath
defaultTextRoute = snd . breakEnd (== '/') . unmdize . toFilePath
