module Main(main) where

import Graphics.Gloss
import Graphics.Gloss.Interface.IO.Game

import HandleInput
import Game

main :: IO ()
--     display :: Display -> Color -> Picture
-- main = play window background fps initialState render handleKeys update

-- ================================================================================================================================
-- ================================================================================================================================
main = play window background fps newInitialState newRender newHandleKeys newUpdate


    --where
--displaying = display window background (render (movePlayers North initialState) pictureList)