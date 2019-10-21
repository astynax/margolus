-- | Step-by-step "Margolus neighborhood" CA simulator.

module Main where

import Data.List
import System.IO

import Margolus.Evaluator
import qualified Margolus.Rules.Water as Water
import qualified Margolus.Rules.Sand as Sand
import qualified Margolus.Rules.Simple as Simple
import Margolus.Types


type Renderer = Field -> [String]

data LoopState
  = LoopState
    { phase   :: Bool
    , renders :: [Renderer]
    }


main :: IO ()
main = do
  hSetEcho stdin False
  hSetBuffering stdin NoBuffering
  selectDemo >>= uncurry (flip loop initialState)
  where
    nums = "123456789"
    selectDemo = do
      clearScreen
      putStrLn "--------------"
      putStrLn "Choose a demo:"
      putStrLn "--------------"
      mapM_ putStrLn $ zipWith (\k v -> k:':':v) nums (map fst demos)
      ch <- getChar
      case elemIndex ch nums of
        Just x | x < length demos ->
          pure $ snd $ demos !! x
        _                         ->
          selectDemo

demos :: [(String, (Rules, RuleTable))]
demos =
  [ ("\"Billiard Ball Machine\"", (bBM,                   bBBox))
  , ("\"Sand\" (hg)",             (makeRules Sand.rules,  hourglass))
  , ("\"Sand\"",                  (makeRules Sand.rules,  drops))
  , ("Crystallization",           (makeRules Water.rules, drops))
  , ("\"Bounce Gas\"",            (bounceGas,             threads))
  ]

bBM :: Rules
bBM =
  Simple.make2BitRules ' ' '*' [0,8,4,3,2,5,9,7,1,6,10,11,12,13,14,15]

bBBox :: Field
bBBox =
  [ "**********************"
  , "*                    *"
  , "*                    *"
  , "*              *     *"
  , "*                    *"
  , "*                *   *"
  , "*                    *"
  , "*                    *"
  , "*                    *"
  , "*                    *"
  , "**********************"
  ]


bounceGas :: Rules
bounceGas =
  Simple.make2BitRules ' ' '*' [0,1,2,12,4,10,9,7,8,6,5,11,3,13,14,15]

threads :: Field
threads =
  [ "                                  "
  , "            *                     "
  , "    *      *                      "
  , "     ******                       "
  , "                  *    *          "
  , "                 *    *           "
  , "                *    *            "
  , "                *    *            "
  , "                 **   **          "
  , "                   *    *         "
  , "                    *    *        "
  , "                     *    *       "
  , "                                  "
  , "           *****                  "
  , "          *     *                 "
  , "        **       *                "
  , "                                  "
  , "                                  "
  ]


drops :: Field
drops =
  [ "...$....................................."
  , "..........$..................$$......$$.."
  , "........................................."
  , "..........................#.............."
  , "...........................#............#"
  , "............................#..........#."
  , ".......#.....#...............#........#.."
  , "........#####.................#......#..."
  , "...............................#....#...."
  , "...............#........................."
  , "...........#...#........................."
  , "............###.........................."
  , "........................................."
  , "........................................."
  , "........................................."
  , "........................................."
  , "........................................."
  , "........................................."
  , "........................................."
  , "........................................."
  , "........................................."
  , "........................................."
  , "........................................."
  ]


hourglass :: Field
hourglass =
  [ "###########"
  , "#.........#"
  , "#*********#"
  , "#*********#"
  , "##*******##"
  , "#.#*****#.#"
  , "#..#***#..#"
  , "#...#.#...#"
  , "#..#...#..#"
  , "#.#.....#.#"
  , "##.......##"
  , "#.........#"
  , "#.........#"
  , "#.........#"
  , "###########"
  ]


loop :: Rules -> LoopState -> Field -> IO ()
loop rules st fld = do
  -- show field
  clearScreen
  printField
  printKeyHelp
  -- interact
  ch <- getChar
  case ch of
    'q' -> return ()
    'r' -> changeRender
    _   -> nextFrame
  where
    recur = loop rules
    nextFrame =
      recur (st { phase = not (phase st) })
        (oneStep rules (phase st) fld)

    changeRender =
      let rs = renders st
      in recur (st { renders = tail rs ++ [head rs] }) fld

    printField =
      let (render:_) = renders st
      in mapM_ putStrLn $ render fld

    printKeyHelp =
      mapM_ putStrLn
        [ "------- keys: -------"
        , "[q] for exit"
        , "[r] change renderer"
        , "any other to continue"
        ]


initialState :: LoopState
initialState = LoopState False [renderAsIs, renderClean]

renderAsIs :: Renderer
renderAsIs = id

renderClean :: Renderer
renderClean = map (map render)
  where
    render '.' = ' '
    render '*' = '.'
    render x   = x

clearScreen :: IO ()
clearScreen = putStr "\ESC[2J"
