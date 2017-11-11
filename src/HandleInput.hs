module HandleInput where
    
    import Graphics.Gloss
    import Graphics.Gloss.Interface.IO.Game
    
    import Game
    {-
    handleKeys :: Event -> GameState -> GameState
    handleKeys (EventKey (Char 'w') _ _ _ ) game = movePlayer North game
    handleKeys (EventKey (Char 'a') _ _ _ ) game = movePlayer West game
    handleKeys (EventKey (Char 's') _ _ _ ) game = movePlayer South game
    handleKeys (EventKey (Char 'd') _ _ _ ) game = movePlayer East game
    handleKeys _ game = game -}
-- ================================================================================================================================
-- ================================================================================================================================
    newHandleKeys :: Event -> NewGameState -> NewGameState
    newHandleKeys (EventKey (Char 'w') _ _ _ ) game = newMovePlayer North game
    newHandleKeys (EventKey (Char 'a') _ _ _ ) game = newMovePlayer West game
    newHandleKeys (EventKey (Char 's') _ _ _ ) game = newMovePlayer South game
    newHandleKeys (EventKey (Char 'd') _ _ _ ) game = newMovePlayer East game
    newHandleKeys _ game = game 