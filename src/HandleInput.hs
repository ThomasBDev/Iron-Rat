module HandleInput where
    
    import Graphics.Gloss
    import Graphics.Gloss.Interface.IO.Game
    
    import Game

    handleKeys :: Event -> GameState -> GameState
    handleKeys (EventKey (Char 'w') _ _ _ ) game = movePlayer North game
    handleKeys (EventKey (Char 'a') _ _ _ ) game = movePlayer West game
    handleKeys (EventKey (Char 's') _ _ _ ) game = movePlayer South game
    handleKeys (EventKey (Char 'd') _ _ _ ) game = movePlayer East game
    
    -- functie om het "vallen" van enemies te testen.
    handleKeys (EventKey (Char 'b') _ _ _ ) game = moveBackgrounds game
    handleKeys (EventKey (Char 'e') _ _ _ ) game = moveEnemies game
    
    handleKeys _ game = game 