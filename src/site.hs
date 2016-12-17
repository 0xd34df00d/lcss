--------------------------------------------------------------------------------
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE QuasiQuotes #-}
import           Data.Monoid
import           Hakyll

import qualified Data.HashMap.Strict as M
import Data.List.Split
import Data.List
import Data.Maybe
import Control.Arrow
import Control.Monad
import Data.String.Interpolate


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

    match ("text/plugins/*.md" .||. "text/plugins/*/*.md") $ do
        route $ customRoute $ dropPrefix "text/plugins/" . unmdize . toFilePath
        compile $ pandocCompiler
                >>= loadAndApplyTemplate "templates/default.html" defaultContext
                >>= relativizeUrls

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
    match "posts/*" $ do
        route $ setExtension "html"
        compile $ pandocCompiler
            >>= loadAndApplyTemplate "templates/post.html"    postCtx
            >>= loadAndApplyTemplate "templates/default.html" postCtx
            >>= relativizeUrls

    create ["archive.html"] $ do
        route idRoute
        compile $ do
            posts <- recentFirst =<< loadAll "posts/*"
            let archiveCtx =
                    listField "posts" postCtx (return posts) `mappend`
                    constField "title" "Archives"            `mappend`
                    defaultContext

            makeItem ""
                >>= loadAndApplyTemplate "templates/archive.html" archiveCtx
                >>= loadAndApplyTemplate "templates/default.html" archiveCtx
                >>= relativizeUrls

    match "index.html" $ do
        route idRoute
        compile $ do
            posts <- recentFirst =<< loadAll "posts/*"
            let indexCtx =
                    listField "posts" postCtx (return posts) `mappend`
                    constField "title" "Home"                `mappend`
                    defaultContext

            getResourceBody
                >>= applyAsTemplate indexCtx
                >>= loadAndApplyTemplate "templates/default.html" indexCtx
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


imageRefsCompiler :: String -> Item String -> Compiler (Item String)
imageRefsCompiler imgs t = do
    chunks <- mapM imageSizeFiller $ toChunks $ itemBody t
    mapM thumbnailsCompiler chunks
    pure t { itemBody = concatMap showChunk chunks }

imageSizeFiller :: ExtractChunk -> Compiler ExtractChunk
imageSizeFiller c@ChunkImgRef {} = do
    [w, h] <- words <$> unixFilter "identify" ["-format", "%w %h", imgUrl c] ""
    let dims = Just (read w, read h)
    pure c { imgDims = msum [imgDims c, dims], imgSrcDims = dims }
imageSizeFiller c = pure c

thumbnailsCompiler :: ExtractChunk -> Compiler ExtractChunk
thumbnailsCompiler c@ChunkImgRef { .. } | imgDims /= imgSrcDims = do
    let Just (w, h) = imgDims
    unixFilter "convert" [imgUrl, "-geometry", show w <> "x" <> show h, thumbFilename w h imgUrl] ""
    pure c
thumbnailsCompiler c = pure c

data ImgAlign = AlignLeft | AlignRight | AlignInline deriving (Eq, Show)

data ExtractChunk = ChunkText String
                  | ChunkImgRef {
                        imgUrl :: String,
                        imgTitle :: String,
                        imgAlign :: ImgAlign,
                        imgIsLink :: Bool,
                        imgDims :: Maybe (Int, Int),
                        imgSrcDims :: Maybe (Int, Int)
                    } deriving (Eq, Show)

showChunk :: ExtractChunk -> String
showChunk (ChunkText s) = s
showChunk ChunkImgRef { .. } | imgIsLink = [i|<a href="#{imgUrl}"><img src="#{thumbFilename w h imgUrl}" width="#{w}" height="#{h}" alt="#{imgTitle}" /></a>|]
                             | otherwise = [i|<img src="#{imgUrl}" width="#{w}" height="#{h}" alt="#{imgTitle}" />|]
    where Just (w, h) = imgDims

thumbFilename :: Int -> Int -> String -> String
thumbFilename w h s = n <> "hakyllthumb_" <> show w <> "_" <> show h <> "." <> ext
    where (ext, n) = join (***) reverse $ break (== '.') $ reverse s

toChunks :: String -> [ExtractChunk]
toChunks s = ChunkText h : concatMap (\(a, b) -> [a, b]) (buildChunk <$> rest)
    where (h:rest) = splitOn "[img_assist|" s

buildChunk :: String -> (ExtractChunk, ExtractChunk)
buildChunk s = (parseExpr expr, ChunkText rest)
    where (expr, _:rest) = break (== ']') s

parseExpr :: String -> ExtractChunk
parseExpr s = ChunkImgRef { .. }
    where sts = M.fromList $ (second tail . break (== '=') <$>) $ splitOn "|" s
          imgUrl = sts M.! "url"
          imgTitle = M.lookupDefault "" "url" sts
          imgAlign | Nothing <- val = AlignInline
                   | Just "left" <- val = AlignLeft
                   | Just "right" <- val = AlignRight
                   | Just "inline" <- val = AlignInline
                   | Just x <- val = error $ "Unknown image alignment: " <> x
            where val = M.lookup "align" sts
          imgIsLink = isJust $ M.lookup "link" sts
          imgDims = join (***) read <$> ((,) <$> M.lookup "width" sts <*> M.lookup "height" sts)
          imgSrcDims = Nothing
