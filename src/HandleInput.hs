module HandleInput where

import Graphics.Gloss
import Graphics.Gloss.Interface.IO.Game

import Game

handleKeys :: Event -> GameState -> GameState
handleKeys (EventKey (Char 'w') _ _ _ ) game = movePlane North game
handleKeys _ game = game 