module Player where

import Graphics.Gloss

data Player = PlayerInfo {playerPos :: (Float, Float), health :: Int, playerSprite :: Picture}