//called by player

var a;
a=instance_create_depth(x,y-10,-1,mine)
a.right=right
a.scale=1
a.creator=a.id
a.player_who_placed_mine=self.id
a.direction=octdir
return a