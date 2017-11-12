module Player where

import Graphics.Gloss

data Player = PlayerInfo {playerX :: Float, playerY :: Float, health :: Int, playerSprite :: Picture}



movePlayerPicture :: Player -> Picture
movePlayerPicture player = translate xPos yPos pic
                         where
                         xPos = playerX player
                         yPos = playerY player
                         pic = playerSprite player