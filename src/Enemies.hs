module Enemies where

import Graphics.Gloss

data Status = Dead | Alive

data Position = Position Float Float
        deriving (Eq)

data EnemyType = Rocket | Plane | Tank | Tower | Ship | Boss

data Enemy = Enemy { status :: Status, position :: Position, enemyType :: EnemyType, sprite :: Picture }