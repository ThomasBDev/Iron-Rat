module Game where

import Graphics.Gloss
import Graphics.Gloss.Interface.IO.Game
import Graphics.Gloss.Data.ViewPort

import Player
import Enemies


window :: Display
--                Naam van de Window, (Breedte Window, Hoogte Window) (X-positie Window in scherm, Y-positie Window in scherm)
window = InWindow "Nice Window" (1000, 600) (10,10)

background :: Color
background = white

fps :: Int
fps = 60

ground, drawing, drawing1, drawing2 :: Picture
ground = translate 0 1200 (color green (polygon (rectanglePath 1000 2400)))
drawing = circle 10
drawing1 = translate 200 200 (circle 30)
drawing2 = translate (-400) (-100) (circle 100)


pictureList :: [Picture]
pictureList = [ground, drawing, drawing1, drawing2]

-- testEnemy :: Enemy
-- testEnemy = testEnemy { status = Alive, position = (0.0, 0.0), enemyType = Plane, sprite = drawing2 }

-- enemyList :: [Enemy]
-- enemyList = []


data Direction = North | East | South | West
    
data GameState = Game { player :: Player , planeSpeed :: Float , spriteList :: [Picture]}

initialState :: GameState
initialState = Game {player = startPlayer, planeSpeed = 0.0, spriteList = pictureList}



linePath :: Path
linePath = [(0, 0), (100, 0), (100, 100)]

trianglePath :: Path
trianglePath = [(0.0, 0.0), (100, 100), (-200, 200)]

lijn = line trianglePath
driehoek = polygon trianglePath
vierkant = polygon (rectanglePath 100 100)

startPlayer :: Player
startPlayer = PlayerInfo {playerPos = (0.0,0.0), health = 100, playerSprite = color blue vierkant}



update :: Float ->  GameState -> GameState
update _ game = game

movePlane :: Direction -> GameState -> GameState
movePlane North game = game{player = (player game) { playerSprite = translate 0 10 (playerSprite (player game)), playerPos = (xv, yv) }}
    where
    (x, y) = playerPos (player game)
    (xv, yv) = (x, y+10)
movePlane East game = game{player = (player game) { playerSprite = translate 10 0 (playerSprite (player game)), playerPos = (xv, yv) }}
    where
    (x, y) = playerPos (player game)
    (xv, yv) = (x+10, y)
movePlane South game = game{player = (player game) { playerSprite = translate 0 (-10) (playerSprite (player game)), playerPos = (xv, yv) }}
    where
    (x, y) = playerPos (player game)
    (xv, yv) = (x, y-10)
movePlane West game = game{player = (player game){  playerSprite = translate (-10) 0 (playerSprite (player game)), playerPos = (xv, yv) }}
    where
    (x, y) = playerPos (player game)
    (xv, yv) = (x-10, y)

-- Neemt een GameState en lijst van Pictures en zet het om naar één Picture voor de display methode in main.
render :: GameState -> Picture
render game = pictures pics
    where
    pics = spriteList game ++ [(playerSprite(player game))]