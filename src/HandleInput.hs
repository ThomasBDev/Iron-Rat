module HandleInput where

import Game
import Graphics.Gloss
import Graphics.Gloss.Interface.IO.Game



handleKeys :: Event -> GameState -> GameState
handleKeys (EventKey (Char 'w') _ _ _ ) game = movePlayer North game
handleKeys (EventKey (Char 'a') _ _ _ ) game = movePlayer West game
handleKeys (EventKey (Char 's') _ _ _ ) game = movePlayer South game
handleKeys (EventKey (Char 'd') _ _ _ ) game = movePlayer East game
    
-- functie om het "vallen" van de enemies en het autoscrollen te testen.
handleKeys (EventKey (Char 'b') _ _ _ ) game = moveBackgrounds game
handleKeys (EventKey (Char 'e') _ _ _ ) game = moveEnemies game
handleKeys (EventKey (Char 'x') _ _ _ ) game = combinedMove game
    
handleKeys _ game = game