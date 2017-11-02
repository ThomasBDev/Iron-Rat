module Main(main) where

import Graphics.Gloss
import Graphics.Gloss.Interface.IO.Game

import Enemies
import HandleInput
import Game

main :: IO ()
--     display :: Display -> Color -> Picture
main = play window background fps initialState render handleKeys update
    --where
    --displaying = display window background (render (movePlane North initialState) pictureList)