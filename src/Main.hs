module Main(main) where

import Graphics.Gloss
import Enemies

window :: Display
--                Naam van de Window, (Breedte Window, Hoogte Window) (X-positie Window in scherm, Y-positie Window in scherm)
window = InWindow "Nice Window" (1000, 600) (10,10)

background :: Color
background = green

drawing, drawing1, drawing2 :: Picture
drawing = circle 10
drawing1 = translate 200 200 (circle 30)
drawing2 = translate (-400) (-100) (circle 100)

pictureList :: [Picture]
pictureList = [drawing, drawing1, drawing2]

-- testEnemy :: Enemy
-- testEnemy = testEnemy { status = Alive, position = (0.0, 0.0), enemyType = Plane, sprite = drawing2 }

-- enemyList :: [Enemy]
-- enemyList = []

main :: IO ()
--     display :: Display -> Color -> Picture
main = display window background (render (movePlane North initialState) pictureList)


-- Deze GameState bevat nu alleen nog 1 Plane.
{-data GameState = Game 
    { planePos :: (Float, Float), planeSpeed :: Float }

initialState :: GameState
initialState = Game 
     { planePos = (0.0,0.0), planeSpeed = 0.0 }-}

data Direction = North | East | South | West
    
data GameState = Game { player :: Player , planeSpeed :: Float }

initialState :: GameState
initialState = Game {player = startPlayer, planeSpeed = 0.0 }

data Player = PlayerInfo {playerPos :: (Float, Float), health :: Int, picture :: Picture}

startPlayer :: Player
startPlayer = PlayerInfo {playerPos = (0.0,0.0), health = 100, picture = circle 30}

movePlane :: Direction -> GameState -> GameState
movePlane North game = game{player = (player game) { playerPos = (xv, yv)}}
    where
    (x, y) = playerPos (player game)
    (xv, yv) = (x, y+10)
movePlane East game = game{player = (player game) { playerPos = (xv, yv)}}
    where
    (x, y) = playerPos (player game)
    (xv, yv) = (x+10, y)
movePlane South game = game{player = (player game) { playerPos = (xv, yv)}}
    where
    (x, y) = playerPos (player game)
    (xv, yv) = (x, y-10)
movePlane West game = game{player = (player game) { playerPos = (xv, yv)}}
    where
    (x, y) = playerPos (player game)
    (xv, yv) = (x-10, y)

-- Neemt een GameState en lijst van Pictures en zet het om naar één Picture voor de display methode in main.
render :: GameState -> [Picture] -> Picture
render game pics = pictures (map movePics pics)
    where
    movePics = uncurry translate (playerPos (player game))