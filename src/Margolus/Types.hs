-- | Common types.

module Margolus.Types where


type Cell = Char

type Block = ((Cell, Cell), (Cell, Cell))

type RuleTable = [String]

type Rules = Block -> Block

type Field = [[Cell]]
