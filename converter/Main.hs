import qualified Data.Text as T
import qualified Data.Text.IO as TI
import qualified Data.ByteString.Lazy.Char8 as BS
import Data.List
import System.Environment

import Loader
import Html2Markdown
import Site

writePage :: ([String], T.Text) -> IO ()
writePage (path, contents) = putStrLn $ "Would write to: " ++ intercalate  "/" path --TI.writeFile (intercalate  "/" path) contents

process :: [String] -> IO ()
process files | length files == 3 = do
    datas <- mapM BS.readFile files
    case processFiles datas of
        Left err -> putStrLn $ "Unable to load data: " ++ err
        Right res -> mapM_ writePage $ convertSite res

main :: IO ()
main = getArgs >>= process
