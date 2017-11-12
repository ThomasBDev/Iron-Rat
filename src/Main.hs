module Main(main) where

import Graphics.Gloss
import Graphics.Gloss.Interface.IO.Game

import HandleInput
import Game



main :: IO ()
main = play window backgroundColor fps initialState render handleKeys update
     -- where
     -- displaying = display window background (render (movePlayers North initialState) pictureList)