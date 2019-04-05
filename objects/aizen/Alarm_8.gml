var a;
a=instance_create(0,0,aizen)
a.player_priority=player_priority+1
if a.player_priority>kouchou.playersin
    a.player_priority=1



instance_destroy()

