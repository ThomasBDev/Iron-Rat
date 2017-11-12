module Game where

import Graphics.Gloss
import Graphics.Gloss.Interface.IO.Game
import Graphics.Gloss.Data.ViewPort

import Player
import Enemies
import Background

data Direction = North | East | South | West

data GameState = Game { player :: Player, enemyList :: [Enemy], backgroundList :: [Background] }



-- Polygon testwaardes
linePath :: Path
linePath = [(0, 0), (100, 0), (100, 100)]

trianglePath :: Path
trianglePath = [(0.0, 0.0), (100, 100), (-200, 200)]

lijn = line trianglePath
driehoek = polygon trianglePath
vierkant = polygon (rectanglePath 100 100)



window :: Display
--                Naam van de Window, (Breedte Window, Hoogte Window) (X-positie Window in scherm, Y-positie Window in scherm)
window = InWindow "Nice Window" (1000, 600) (10,10)

-- De kleur van de achtergrond onder de backgroundObjecten.
backgroundColor :: Color
backgroundColor = white

-- Hoeveel keer per seconde een GameState wordt gerendered.
fps :: Int
fps = 60



startPlayer :: Player
startPlayer = PlayerInfo { playerX = 0.0, playerY = 0.0, health = 100, playerSprite = color blue vierkant }

initialState :: GameState
initialState = Game { player = startPlayer, enemyList = enemies, backgroundList = [backGround] }



update :: Float ->  GameState -> GameState
update _ game = game



-- Pas playerX of playerY aan als de speler W, A, S of D indrukt.
-- De nieuwe playerX en playerY waardes worden dan in render gebruikt om ook de Picture aan te passen.
movePlayer :: Direction -> GameState -> GameState
movePlayer North game = game { player = (player game) { playerY = yv } }
                      where
                      y = playerY (player game)
                      yv = y + 10
movePlayer East game  = game { player = (player game) { playerX = xv } }
                      where
                      x= playerX (player game)
                      xv = x + 10
movePlayer South game = game { player = (player game) { playerY = yv } }
                      where
                      y = playerY (player game)
                      yv = y - 10
movePlayer West game  = game { player = (player game) { playerX = xv } }
                      where
                      x= playerX (player game)
                      xv = x - 10
                      
-- Functie die de positie van alle vijanden en achtergrondobjecten aanpast.
-- De functie geeft dus een GameState terug waarin de enemyX, enemyY, backX en backY van alle vijanden en achtergrondobjecten zijn aangepast.       
combinedMove :: GameState -> GameState
combinedMove game = game { enemyList = newEnemyList, backgroundList = newBackgroundList }
                  where
                  newEnemyList = map moveEnemy (enemyList game)
                  newBackgroundList = map moveBackground (backgroundList game)

                  
                  
-- Neemt een GameState en lijst van Pictures en zet het om naar één Picture voor de display methode in main.  
render :: GameState -> Picture
render game = pictures pics
            where
            -- De volgorde bepaalt welke Pictures als eerste worden gerendered.
            -- Meest linkse gaan als eerste.
            pics = backgroundPics ++ enemyPics ++ playerPic
            backgroundPics = map moveBackgroundPicture (backgroundList game)
            enemyPics = map moveEnemyPicture (enemyList game)
            playerPic = [movePlayerPicture (player game)]