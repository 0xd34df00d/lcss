--------------------------------------------------------------------------------
{-# LANGUAGE OverloadedStrings #-}
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
                >>= imageRefsCompiler "images/"

    match ("text/plugins/*.md" .||. "text/plugins/*/*.md") $ do
        route $ customRoute $ dropPrefix "text/plugins/" . unmdize . toFilePath
        compile $ pandocCompiler
                >>= loadAndApplyTemplate "templates/default.html" defaultContext
                >>= relativizeUrls
                >>= imageRefsCompiler "images/"

    create ["plugins"] $ do
        route idRoute
        compile $ do
            plugins <- loadAll "text/plugins/*.md"
            let pluginsCtx =
                    listField "plugins" defaultContext (return plugins) <>
                    constField "title" "Plugins" <>
                    defaultContext
            makeItem ""
                >>= loadAndApplyTemplate "templates/plugins.html" pluginsCtx
                >>= loadAndApplyTemplate "templates/default.html" pluginsCtx
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
