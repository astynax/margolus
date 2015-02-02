module Engine (Cell, Block, Rules, Field,
               oneStep, makeRules) where

import Data.Maybe (fromJust)


type Cell = Char

type Block = ((Cell, Cell), (Cell, Cell))
type Rules = Block -> Block

type Field = [[Cell]]


makeRules :: [String] -> Rules
makeRules ls = fromJust . (`lookup` table)
    where
       table = concatMap makeRule (pair ls)

       pair [] = []
       pair (x:y:ys) = (x, y) : pair ys

       makeRule ([], []) = []
       makeRule (i1:j1:_:i2:j2:_:xs, k1:l1:_:k2:l2:_:ys) =
           (((i1, k1), (j1, l1)), ((i2, k2), (j2, l2))) : makeRule (xs, ys)


mapToPairs :: Bool -> ((a, a) -> (a, a)) -> [a] -> [a]
mapToPairs shifted fn l = unpairs [] $ map process $
    case (shifted, l) of
        (True, x : xs) -> pairs xs [Left x]
        (False,    xs) -> pairs xs []
    where
        pairs []       acc = acc
        pairs [x]      acc = pairs [] (Left x       : acc)
        pairs (x:y:ys) acc = pairs ys (Right (x, y) : acc)

        unpairs acc []                  = acc
        unpairs acc (Left x       : xs) = unpairs (x : acc) xs
        unpairs acc (Right (x, y) : ys) = unpairs (x : y: acc) ys

        process (Right pair) = Right (fn pair)
        process x = x


oneStep :: Rules -> Field -> Bool -> Field
oneStep rules field flag =
    mapToPairs flag (unzip . mapToPairs flag rules . uncurry zip) field
