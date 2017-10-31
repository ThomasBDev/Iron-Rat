module Enemies where



data Status = Dead | Alive

data Position = Position Float Float
        deriving (Eq)

data EnemyType = Plane | Rocket | Tank | Tower | Ship | Boss

data Enemy = Enemy Status Position EnemyType