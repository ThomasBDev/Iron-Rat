module Main where

import Graphics.Gloss



-- De eigenschappen van het venster.
window :: Display
window = InWindow "Nice Window" (200, 200) (10, 10)

-- Achtergrondskleur.
background :: Color
background = white

-- Een plaatje om te tekenen.
drawing :: Picture
drawing = circle 100



-- display :: Display -> Color -> Picture -> IO()
main :: IO()
main = display window background drawing