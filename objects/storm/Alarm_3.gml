if kouchou.map=="multiplayer"
    stack_call_next()
  
aizen.player_priority=aizen.player_priority+1
if aizen.player_priority>kouchou.players_in   ///players_in should be replaced with a proper storage of the players in the game
    aizen.player_priority=1


      
instance_destroy()

