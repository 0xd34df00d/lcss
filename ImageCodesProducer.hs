{-# LANGUAGE DeriveGeneric, DeriveAnyClass #-}
{-# LANGUAGE QuasiQuotes, RecordWildCards, OverloadedStrings, LambdaCase #-}

module ImageCodesProducer
( compileImageInfo
, prepareImageDb
, ImagesDb
) where

import qualified Data.Aeson as A
import qualified Data.ByteString.Lazy.Char8 as BS
import qualified Data.HashMap.Strict as HM
import Control.Applicative
import Control.Concurrent.ParallelIO.Local
import Control.Monad.Extra
import Data.Char
import Data.List
import Data.String.Interpolate
import GHC.Generics
import System.Directory
import System.Process
import Text.Pandoc.Definition(Inline(..))

data ImgAlign = AlignLeft | AlignRight | AlignInline
  deriving (Eq, Ord, Show)

instance A.FromJSON ImgAlign where
  parseJSON o = textParser o <|> pure AlignInline
    where textParser = A.withText "ImgAlign" $
            \case "left" -> pure AlignLeft
                  "right" -> pure AlignRight
                  "inline" -> pure AlignInline
                  t -> fail [i|Unknown alignment: #{t}|]

data ThumbSize = ThumbSmall | ThumbMedium | ThumbLarge
  deriving (Eq, Ord, Show, Enum, Bounded)

instance A.FromJSON ThumbSize where
  parseJSON = A.withText "ThumbSize" $ \case "small" -> pure ThumbSmall
                                             "medium" -> pure ThumbMedium
                                             "large" -> pure ThumbLarge
                                             t -> fail [i|Unknown thumb size: #{t}|]

data ImageRefInfo = ImageRefInfo
  { title :: String
  , name :: String
  , thumb :: Maybe ThumbSize
  , align :: ImgAlign
  } deriving (Eq, Ord, Show, Generic, A.FromJSON)

compileImageInfo :: ImagesDb -> String -> Inline
compileImageInfo db str | Left err <- decoded = error $ "Unable to decode image info: " <> err
                        | Right ii <- decoded = producePandoc db ii
  where decoded = A.eitherDecode $ BS.pack str

producePandoc :: ImagesDb -> ImageRefInfo -> Inline
producePandoc ImagesDb { .. } ImageRefInfo { .. } = RawInline "html" fullHtml
  where
    origDims' = origDims $ images HM.! name
    (imgPath, (width, height)) = case thumb of
                                      Just thumbTy -> (thumbDirName thumbTy, scale origDims' thumbTy)
                                      Nothing      -> ("", origDims')
    fullHtml = [i|
<div class="img-wrap img-wrap-#{drop 5 $ toLower <$> show align}">
    <a href="/#{rootPath}/#{name}">
      <img src="/#{rootPath}/#{imgPath}/#{name}" width="#{width}" height="#{height}" alt="#{title}" title="#{title}" /><br/>
      <strong>#{title}</strong>
    </a>
</div>
|]

thumbDirName :: ThumbSize -> String
thumbDirName thumbTy = drop 5 $ toLower <$> show thumbTy

thumbWidth :: ThumbSize -> Int
thumbWidth = \case ThumbSmall -> 220
                   ThumbMedium -> 440
                   ThumbLarge -> 800

scale :: (Int, Int) -> ThumbSize -> (Int, Int)
scale (w, h) thumbTy = (targetW, round' $ fromIntegral (h * targetW) / (fromIntegral w :: Double))
  where
    targetW = thumbWidth thumbTy
    round' v | v - fromIntegral (floor v :: Int) == 0.5 = ceiling v
             | otherwise = round v

data DiskImageInfo = DiskImageInfo
  { origPath :: String
  , origDims :: (Int, Int)
  } deriving (Eq, Ord, Show)

data ImagesDb = ImagesDb
  { rootPath :: String
  , images :: HM.HashMap String DiskImageInfo
  } deriving (Eq, Ord, Show)

prepareImageDb :: String -> IO ImagesDb
prepareImageDb rootPath = do
  fileNames <- filter isOrigImage <$> listDirectory rootPath
  compileThumbnails rootPath fileNames
  let files = (rootPath <>) <$> fileNames
  output <- readProcess "identify" (["-format", "%w %h\n"] <> files) ""
  let filesDims = parseDims <$> lines output
  let images = HM.fromList [ (name, DiskImageInfo { .. })
                           | (name, origPath, origDims) <- zip3 fileNames files filesDims
                           ]
  pure ImagesDb { .. }
  where
    isOrigImage name = ".png" `isSuffixOf` name
                    && not ("hakyllthumb" `isInfixOf` name)
    parseDims line | [w, h] <- words line = (read w, read h)
                   | otherwise = error $ "Unable to parse " <> line

compileThumbnails :: String -> [String] -> IO ()
compileThumbnails rootPath names = do
  forM_ thumbs $ \thumb -> createDirectoryIfMissing False $ rootPath <> thumbDirName thumb
  void $ withPool 10 $ \pool -> parallel pool [ f name thumb | name <- names , thumb <- thumbs ]
  where
    thumbs = [minBound .. maxBound]
    f name thumb = do
      let inFile = rootPath <> name
      let outFile = rootPath <> thumbDirName thumb <> "/" <> name
      unlessM (doesFileExist outFile) $ do
        putStrLn $ "Generating thumbnail for " <> outFile
        callProcess "convert" [inFile, "-resize", show $ thumbWidth thumb, outFile]
