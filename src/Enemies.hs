module Enemies where

import Graphics.Gloss

data Status = Dead | Alive

data Position = Position Float Float
        deriving (Eq)

data EnemyType = Rocket | Plane | Tank | Tower | Ship | Boss

data Enemy = Enemy { status :: Status, enemyX :: Float, enemyY :: Float, enemyType :: EnemyType, sprite :: Picture }



enemies :: [Enemy]
enemies = [testEnemy, testEnemy1]

-- Test Picture
vijandPic, vijandPic1 :: Picture
vijandPic  = color yellow (thickCircle 100 20)
vijandPic1 = color red (thickCircle 50 40)

-- Test Enemy
testEnemy, testEnemy1 :: Enemy
testEnemy  = createEnemy ( Position 0 200, Plane, vijandPic )
testEnemy1 = createEnemy ( Position (-100) (-50), Plane, vijandPic1 )

-- Maak een Enemy object aan.
-- Picture heeft een aparte translate nodig.
-- Anders blijft de sprite op Position 0 0 staan, terwijl position zegt, dat het Position X Y is.
createEnemy :: (Position, EnemyType, Picture) -> Enemy
createEnemy (pos, enType, pic) = Enemy { status = Alive, enemyX = 0.0, enemyY = 0.0, enemyType = enType, sprite = newPic }
                               where
                               Position xVal yVal = pos
                               newPic = translate xVal yVal pic

-- Functie die de positie van een Enemy object aanpast.    
-- Dit zou per cyclus moeten worden uitgevoerd zodat de vijanden naar beneden "vallen".
moveEnemy :: Enemy -> Enemy
moveEnemy enemy = enemy { enemyY = ((enemyY enemy) - fallSpeed) }
                where
                fallSpeed = 10
                
-- Pas de Picture van een Enemy aan aan de hand van de enemyX en enemyY.
-- Deze nieuwe Pictures worden dan in Render getekend.
moveEnemyPicture :: Enemy -> Picture
moveEnemyPicture enemy = translate xPos yPos pic
                       where
                       xPos = enemyX enemy
                       yPos = enemyY enemy
                       pic = sprite enemy