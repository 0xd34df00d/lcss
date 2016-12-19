--------------------------------------------------------------------------------
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RecordWildCards #-}
import           Data.Monoid
import           Hakyll

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

    match "templates/*" $ compile templateBodyCompiler

unmdize :: String -> String
unmdize s = take (length s - 3) s

dropPrefix :: String -> String -> String
dropPrefix s = drop $ length s

--------------------------------------------------------------------------------
postCtx :: Context String
postCtx =
    dateField "date" "%B %e, %Y" `mappend`
    defaultContext

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
defaultTextRoute = dropPrefix "text/plugins/" . unmdize . toFilePath
