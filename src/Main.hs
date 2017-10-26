module Main(main) where

import Graphics.Gloss

window :: Display
window = InWindow "Nice Window" (800, 1200) (10,10)

background :: Color
background = white

drawing :: Picture
drawing = translate 20 20 (circle 30)

main :: IO ()
main = display window background drawing


data GameState = Game 
    { planePos :: (Float, Float), planeSpeed :: Float }

initialState :: GameState
initialState = Game 
    { planePos = (0.0,0.0), planeSpeed = 0.0 }

