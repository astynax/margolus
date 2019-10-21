module Margolus.Rules.Simple ( make2BitRules ) where

import Data.Maybe

import Margolus.Types


possibleStates :: Cell -> Cell -> [Block]
possibleStates c0 c1 =
  [ ((i, k), (j, l))
  | i <- cs
  , j <- cs
  , k <- cs
  , l <- cs
  ]
  where cs = [c0, c1]

make2BitRules :: Cell -> Cell -> [Int] -> Rules
make2BitRules c0 c1 idxs =
  fromJust . (`lookup` table)
  where
    table =
      let blocks = possibleStates c0 c1
      in zip blocks $ map (blocks !!) idxs
