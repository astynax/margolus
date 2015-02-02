{--
Tool for generation of rule table templates
--}
module Main where

import Data.List

main = putStrLn showAll

partitate n ls = f ls []
    where f [] acc = reverse acc
          f ls acc = let (x, xs) = splitAt n ls
                     in f xs (x:acc)

tuples = do
    i <- [0,1,2,3]
    j <- [0,1,2,3]
    k <- [0,1,2,3]
    l <- [0,1,2,3]
    return (i, j, k, l)


showTuple (i, j, k, l) = (row i j, row k l)
    where row x y = toChar x : toChar y : " ..|"
          toChar 0 = '.'
          toChar 1 = '*'
          toChar 2 = '#'
          toChar 3 = '$'


showAll = concat
        $ intercalate divider
        $ map toLines
        $ partitate 16 tuples
    where divider = ["\n" ++ replicate (16 * 6) '-' ++ "\n"]
          toLines = (\(x, y) -> [concat x, "\n", concat y])
                  . unzip
                  . map showTuple
