{- |
Rule table generator.
--}

module Main where

import Data.List


type Quad = (Int, Int, Int, Int)


main :: IO ()
main = putStrLn rules


chunkBy :: Int -> [a] -> [[a]]
chunkBy n = go []
  where
    go acc [] = reverse acc
    go acc ls =
      let (x, xs) = splitAt n ls
      in go (x : acc) xs


quads :: [Quad]
quads = (,,,) <$> r <*> r <*> r <*> r
  where
    r = [0..3]


showQuad :: Quad -> (String, String)
showQuad (i, j, k, l) = (row i j, row k l)
  where
    row x y = toChar x : toChar y : " ..|"
    toChar 1 = '*'
    toChar 2 = '#'
    toChar 3 = '$'
    toChar _ = '.'


rules :: String
rules =
  concat
  $ intercalate divider
  $ map toLines
  $ chunkBy 16 quads
  where
    divider = ["\n" ++ replicate (16 * 6) '-' ++ "\n"]
    toLines =
      (\(x, y) -> [concat x, "\n", concat y])
      . unzip
      . map showQuad
