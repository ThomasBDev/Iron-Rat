module Main(main) where

import Graphics.Gloss

window :: Display
window = InWindow "Nice Window" (1200, 800) (10,10)

background :: Color
background = white

drawing, drawing1 :: Picture
drawing = circle 30
drawing1 = translate 100 (-300) (circle 100)

main :: IO ()
main = display window background (render (movePlane initialState))


data GameState = Game 
    { planePos :: (Float, Float), planeSpeed :: Float }

initialState :: GameState
initialState = Game 
    { planePos = (0.0,0.0), planeSpeed = 0.0 }

movePlane :: GameState -> GameState
movePlane game = game{planePos = (x,y)}
    where
    x = 10
    y = 300

render :: GameState -> Picture
render game = pictures [plane]
    where
    plane = uncurry translate (planePos game) drawing1

