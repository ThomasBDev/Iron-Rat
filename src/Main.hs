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
main = display window background (render (movePlane initialState) pictureList)


-- Deze GameState bevat nu alleen nog 1 Plane.
data GameState = Game 
    { planePos :: (Float, Float), planeSpeed :: Float }

initialState :: GameState
initialState = Game 
    { planePos = (0.0,0.0), planeSpeed = 0.0 }

movePlane :: GameState -> GameState
movePlane game = game { planePos = (x, y) }
    where
    x = 800
    y = 0

-- Neemt een GameState en lijst van Pictures en zet het om naar één Picture voor de display methode in main.
render :: GameState -> [Picture] -> Picture
render game pics = pictures (map movePics pics)
    where
    movePics = uncurry translate (planePos game)