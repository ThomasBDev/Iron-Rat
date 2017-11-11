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

-- Hoeveel keer per seconde een GameState wordt gerendered.
fps :: Int
fps = 60

-- (0, 0) = middelpunt Window.
-- X vergroten --> naar rechts, Y vergroten --> naar boven.
ground, drawing, drawing1, drawing2 :: Picture
ground = translate 0 1200 (color green (polygon (rectanglePath 1000 2400)))
drawing = circle 10
drawing1 = translate 200 200 (circle 30)
drawing2 = translate (-400) (-100) (circle 100)

pictureList :: [Picture]
pictureList = [ground, drawing, drawing1, drawing2]



data Direction = North | East | South | West
    
data GameState = Game { player :: Player , planeSpeed :: Float , spriteList :: [Picture] }


-- ================================================================================================================================
-- ================================================================================================================================
data NewGameState = NewGame { newPlayer :: Player, enemyList :: [Enemy], backgroundList :: [Picture] }

initialState :: GameState
initialState = Game { player = startPlayer, planeSpeed = 0.0, spriteList = pictureList }
-- ================================================================================================================================
-- ================================================================================================================================
newInitialState :: NewGameState
newInitialState = NewGame { newPlayer = startPlayer, enemyList = [testEnemy, testEnemy1], backgroundList = pictureList }



-- Polygon testwaardes
linePath :: Path
linePath = [(0, 0), (100, 0), (100, 100)]

trianglePath :: Path
trianglePath = [(0.0, 0.0), (100, 100), (-200, 200)]

lijn = line trianglePath
driehoek = polygon trianglePath
vierkant = polygon (rectanglePath 100 100)

startPlayer :: Player
startPlayer = PlayerInfo { playerX = 0.0, playerY = 0.0, health = 100, playerSprite = color blue vierkant }



update :: Float ->  GameState -> GameState
update _ game = game
-- ================================================================================================================================
-- ================================================================================================================================
newUpdate :: Float -> NewGameState -> NewGameState
newUpdate _ game = game


{-
movePlayer :: Direction -> GameState -> GameState
movePlayer North game = game { player = (player game) { playerSprite = translate 0 10 (playerSprite (player game)), playerPos = (xv, yv) } }
    where
    (x, y) = playerPos (player game)
    (xv, yv) = (x, y+10)
movePlayer East game  = game { player = (player game) { playerSprite = translate 10 0 (playerSprite (player game)), playerPos = (xv, yv) } }
    where
    (x, y) = playerPos (player game)
    (xv, yv) = (x+10, y)
movePlayer South game = game { player = (player game) { playerSprite = translate 0 (-10) (playerSprite (player game)), playerPos = (xv, yv) } }
    where
    (x, y) = playerPos (player game)
    (xv, yv) = (x, y-10)
movePlayer West game  = game { player = (player game) { playerSprite = translate (-10) 0 (playerSprite (player game)), playerPos = (xv, yv) } }
    where
    (x, y) = playerPos (player game)
    (xv, yv) = (x-10, y)-} 
-- ================================================================================================================================
-- ================================================================================================================================   
newMovePlayer :: Direction -> NewGameState -> NewGameState
newMovePlayer North game = game { newPlayer = (newPlayer game) {playerX = xv, playerY = yv} }
                         where
                         x= playerX (newPlayer game)
                         xv = x
                         y = playerY (newPlayer game)
                         yv = y + 10
newMovePlayer East game = game { newPlayer = (newPlayer game) {playerX = xv, playerY = yv} }
                         where
                         x= playerX (newPlayer game)
                         xv = x + 10
                         y = playerY (newPlayer game)
                         yv = y
newMovePlayer South game = game { newPlayer = (newPlayer game) {playerX = xv, playerY = yv} }
                         where
                         x= playerX (newPlayer game)
                         xv = x
                         y = playerY (newPlayer game)
                         yv = y - 10
newMovePlayer West game = game { newPlayer = (newPlayer game) {playerX = xv, playerY = yv} }
                         where
                         x= playerX (newPlayer game)
                         xv = x - 10
                         y = playerY (newPlayer game)
                         yv = y
    


-- Functie die alle vijanden naar beneden beweegt.
moveEnemies :: NewGameState -> NewGameState
moveEnemies game = game { enemyList = newEnemyList }
                 where
                 newEnemyList = map moveEnemy (enemyList game)
                
-- Functie die alle achtergrondobjecten naar beneden beweegt.
moveBackground :: NewGameState -> NewGameState
moveBackground game = game { backgroundList = newBackgroundList }
                    where
                    newBackgroundList = map moveSingleBackground (backgroundList game)
    
-- Functie die een achtergrondobject naar beneden beweegt.    
-- Dit zou per cyclus moeten worden uitgevoerd zodat het level autoscrollt.
moveSingleBackground :: Picture -> Picture
moveSingleBackground pic = translate 0 5 pic
                
                

-- Neemt een GameState en lijst van Pictures en zet het om naar één Picture voor de display methode in main.
render :: GameState -> Picture
render game = pictures pics
    where
    pics = spriteList game ++ [(playerSprite(player game)), sprite testEnemy, sprite testEnemy1]
-- ================================================================================================================================
-- ================================================================================================================================   
newRender :: NewGameState -> Picture
newRender game = pictures pics
               where
               pics = backgroundList game ++ map sprite (enemyList game) ++ [translate (playerX(newPlayer game)) (playerY(newPlayer game)) (playerSprite (newPlayer game))]