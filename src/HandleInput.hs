module HandleInput where
    
    import Graphics.Gloss
    import Graphics.Gloss.Interface.IO.Game
    
    import Game
    
    handleKeys :: Event -> GameState -> GameState
    handleKeys (EventKey (Char 'w') _ _ _ ) game = movePlane North game
    handleKeys (EventKey (Char 'a') _ _ _ ) game = movePlane West game
    handleKeys (EventKey (Char 's') _ _ _ ) game = movePlane South game
    handleKeys (EventKey (Char 'd') _ _ _ ) game = movePlane East game
    handleKeys _ game = game 