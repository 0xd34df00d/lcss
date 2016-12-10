import qualified Data.Vector as V
import qualified Data.Text as T
import qualified Data.Text.IO as TI
import qualified Data.ByteString.Lazy.Char8 as BS
import Data.List
import System.Environment
import System.Directory

import Loader
import Site
import Node

writePage :: ([String], T.Text) -> IO ()
writePage (filename, contents) = do
    createDirectoryIfMissing True $ intercalate "/" $ take (length outFilename - 1) outFilename
    TI.writeFile (intercalate  "/" $ "out" : filename) contents
    where outFilename = "out" : filename

process :: [String] -> IO ()
process files | length files == 3 = do
    datas <- mapM BS.readFile files
    case processFiles datas of
        Left err -> putStrLn $ "Unable to load data: " ++ err
        Right res -> mapM_ writePage $ convertSite res
process _ = putStrLn "Usage: Main <nodes.csv> <tags.csv> <images.csv>"

main :: IO ()
main = getArgs >>= process
