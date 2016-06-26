import qualified Data.Vector as V
import qualified Data.Text as T
import qualified Data.Text.IO as TI
import qualified Data.ByteString.Lazy.Char8 as BS
import System.Environment

import Node
import Loader
import ImageRefExtractor
import Html2Markdown

--process :: [String] -> IO ()
process files | length files == 3 = do
    datas <- mapM BS.readFile files
    return $ processFiles datas

--main :: IO ()
main = getArgs >>= process
