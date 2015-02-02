{-| Margolus cellular automata demo |-}
module Main where

import           Data.List (elemIndex)
import           System.IO (BufferMode (NoBuffering), hSetBuffering, hSetEcho,
                            stdin)

import           Engine
import qualified Freeze
import qualified Sand
import           Simple


type Render = Field -> [String]

data LoopState = LoopState { phase   :: Bool
                           , renders :: [Render] }


main :: IO ()
main = do
    -- prepare stdin
    hSetEcho stdin False
    hSetBuffering stdin NoBuffering
    selectDemo >>= uncurry (loop initialState)
  where
    selectDemo =
        let nums = "123456789"
        in do
          clearScreen
          putStrLn "--------------"
          putStrLn "Choose a demo:"
          putStrLn "--------------"
          mapM_ putStrLn $ zipWith (\k v -> k:':':v) nums (map fst demos)
          ch <- getChar
          case elemIndex ch nums of
            (Just x) -> if x < length demos
                        then return (snd (demos !! x))
                        else selectDemo
            Nothing  -> selectDemo


demos = [ ("Bouncing ball", (bbRules,                bbField))
        , ("Sand",          (makeRules Sand.rules,   field))
        , ("Frozing",       (makeRules Freeze.rules, field))
        , ("Gas Particles", (bounceGasRules,         bounceGasField)) ]


bbRules = make2BitRules ' ' '*' [0,8,4,3,2,5,9,7,1,6,10,11,12,13,14,15]
bbField = [ "**********************"
          , "*                    *"
          , "*                    *"
          , "*              *     *"
          , "*                    *"
          , "*                *   *"
          , "*                    *"
          , "*                    *"
          , "*                    *"
          , "*                    *"
          , "**********************" ]


bounceGasRules = make2BitRules ' ' '*' [0,1,2,12,4,10,9,7,8,6,5,11,3,13,14,15]
bounceGasField = [ "                                  "
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
                 , "                                  " ]


field = [ "...$....................................."
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
        , "........................................." ]


hourglass = [ "###########"
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
            , "###########" ]


loop :: LoopState -> Rules -> Field -> IO ()
loop st rule fld = do
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
      nextFrame = loop (st { phase = not (phase st) })
                  rule (oneStep rule fld (phase st))

      changeRender = let rs = renders st
                     in loop (st { renders = tail rs ++ [head rs] }) rule fld

      printField = let (render:_) = renders st
                   in mapM_ putStrLn $ render fld

      printKeyHelp = mapM_ putStrLn [ "------- keys: -------"
                                    , "[q] for exit"
                                    , "[r] change renderer"
                                    , "any other to continue" ]


initialState :: LoopState
initialState = LoopState { phase = False
                         , renders = [renderAsIs, renderClean] }

renderAsIs :: Render
renderAsIs = id

renderClean :: Render
renderClean = map (map render)
    where render '.' = ' '
          render '*' = '.'
          render x   = x

clearScreen :: IO ()
clearScreen = putStr "\ESC[2J"
