module HandleInput where

import Game
import Graphics.Gloss
import Graphics.Gloss.Interface.IO.Game



handleKeys :: Event -> GameState -> GameState
handleKeys (EventKey (Char 'w') Down _ _ ) game = game {wdown = True}
handleKeys (EventKey (Char 'w') Up _ _ ) game = game {wdown = False}
handleKeys (EventKey (Char 'a') Down _ _ ) game = game {adown = True}
handleKeys (EventKey (Char 'a') Up _ _ ) game = game {adown = False}
handleKeys (EventKey (Char 's') Down _ _ ) game = game {sdown = True}
handleKeys (EventKey (Char 's') Up _ _ ) game = game {sdown = False}
handleKeys (EventKey (Char 'd') Down _ _ ) game = game {ddown = True}
handleKeys (EventKey (Char 'd') Up _ _ ) game = game {ddown = False}
    
-- functie om het "vallen" van de enemies en het autoscrollen te testen.
handleKeys (EventKey (Char 'x') _ _ _ ) game = combinedMove game
    
handleKeys _ game = game