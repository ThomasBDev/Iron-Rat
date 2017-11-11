module Enemies where

import Graphics.Gloss

data Status = Dead | Alive

data Position = Position Float Float
        deriving (Eq)

data EnemyType = Rocket | Plane | Tank | Tower | Ship | Boss

data Enemy = Enemy { status :: Status, position :: Position, enemyType :: EnemyType, sprite :: Picture }



-- Maak een Enemy object aan.
-- Picture heeft een aparte translate nodig.
-- Anders blijft de sprite op Position 0 0 staan, terwijl position zegt, dat het Position X Y is.
createEnemy :: (Position, EnemyType, Picture) -> Enemy
createEnemy (pos, enType, pic) = Enemy { status = Alive, position = pos, enemyType = enType, sprite = newPic }
                               where
                               Position xVal yVal = pos
                               newPic = translate xVal yVal pic

-- Functie die een Enemy object naar beneden beweegt.    
-- Dit zou per cyclus moeten worden uitgevoerd zodat de vijanden naar beneden "vallen".
moveEnemy :: Enemy -> Enemy
moveEnemy enemy = enemy { position = newPosition, sprite = newSprite }
                where
                Position oldX oldY = position enemy
                newPosition = Position oldX (oldY - fallSpeed)
                oldSprite = sprite enemy
                newSprite = translate 0 (-fallSpeed) oldSprite
                fallSpeed = 10

-- Test Picture
vijandPic, vijandPic1 :: Picture
vijandPic  = color yellow (thickCircle 100 20)
vijandPic1 = color red (thickCircle 50 40)

-- Test Enemy
testEnemy, testEnemy1 :: Enemy
testEnemy  = createEnemy ( Position 0 200, Plane, vijandPic )
testEnemy1 = createEnemy ( Position (-100) (-50), Plane, vijandPic1 )