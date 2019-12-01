var n
n=argument0 //number of players

var hp_xoffset,hp_yoffset;
hp_xoffset=0  //relative to HUDx and HUDy
hp_yoffset=10

for (var playerId = 0; playerId < n; playerId++)
{
	health_bar_x[playerId]=HUDx[playerId]+hp_xoffset
	health_bar_y[playerId]=HUDy[playerId]+hp_yoffset
}

