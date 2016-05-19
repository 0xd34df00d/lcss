import qualified Data.ByteString.Lazy.Char8 as BS
import System.Environment

import Loader

process :: [String] -> IO ()
process files | length files == 3 = do
    datas <- mapM BS.readFile files
    let res = processFiles datas
    return ()
              | otherwise = putStrLn "Usage"

main :: IO ()
main = getArgs >>= process
