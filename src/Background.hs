module Background where

import Graphics.Gloss

data Background = Back { backX :: Float, backY :: Float, backgroundSprite :: Picture }



backGround :: Background
backGround = Back { backX = 0, backY = 1200, backgroundSprite = ground }



moveBackground :: Background -> Background
moveBackground back = back { backY = newBackY }
                    where
                    newBackY = (backY back) - scrollSpeed
                    scrollSpeed = 1
                    
-- Functie die een achtergrondobject naar beneden beweegt.    
-- Dit zou per cyclus moeten worden uitgevoerd zodat het level autoscrollt.
moveBackgroundPicture :: Background -> Picture
moveBackgroundPicture bg = translate xPos yPos pic
                         where
                         xPos = backX bg
                         yPos = backY bg
                         pic = backgroundSprite bg
                         

                         
                         
                         
-- Oude Background mbv. Picture ipv. Background.

-- (0, 0) = middelpunt Window.
-- X vergroten --> naar rechts, Y vergroten --> naar boven.
ground, drawing, drawing1, drawing2 :: Picture
ground = color green (polygon (rectanglePath 1000 2400))
drawing = circle 10
drawing1 = translate 200 200 (circle 30)
drawing2 = translate (-400) (-100) (circle 100)

backgroundPictures :: [Picture]
backgroundPictures = [ground, drawing, drawing1, drawing2]