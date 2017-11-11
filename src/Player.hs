module Player where

import Graphics.Gloss

data Player = PlayerInfo {playerX :: Float, playerY :: Float, health :: Int, playerSprite :: Picture}