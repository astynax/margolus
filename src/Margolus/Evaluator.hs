module Margolus.Evaluator
  ( Cell, Block, Rules, Field
  , oneStep, makeRules
  ) where

import Data.Maybe (fromJust)

import Margolus.Types


makeRules :: RuleTable -> Rules
makeRules ls =
  fromJust . (`lookup` table)
  where
    table = concatMap makeRule (pairwise ls)

    pairwise (x:y:ys) = (x, y) : pairwise ys
    pairwise _ = error "pairwise: bad input!"

    makeRule (i1:j1:_:i2:j2:_:xs, k1:l1:_:k2:l2:_:ys) =
      (((i1, k1), (j1, l1)), ((i2, k2), (j2, l2))) : makeRule (xs, ys)
    makeRule _ = []


oneStep :: Rules -> Bool -> Field -> Field
oneStep rules flag =
  mapToPairs flag (unzip . mapToPairs flag rules . uncurry zip)


mapToPairs :: Bool -> ((a, a) -> (a, a)) -> [a] -> [a]
mapToPairs shifted fn l =
  unpairs [] $ map process $
    case (shifted, l) of
      (True, x : xs) -> pairs xs [Left x]
      (_,        xs) -> pairs xs []
    where
      pairs []       acc = acc
      pairs [x]      acc = pairs [] (Left x       : acc)
      pairs (x:y:ys) acc = pairs ys (Right (x, y) : acc)

      unpairs acc []                  = acc
      unpairs acc (Left x       : xs) = unpairs (x : acc) xs
      unpairs acc (Right (x, y) : ys) = unpairs (x : y: acc) ys

      process (Right pair) = Right (fn pair)
      process x = x
