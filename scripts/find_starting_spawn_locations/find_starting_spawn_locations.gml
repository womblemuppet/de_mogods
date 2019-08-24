var xl,xr,xm;
xl=kouchou.room_left_border_x
xm=kouchou.room_x_halfway
xr=kouchou.room_right_border_x

spawn_positions_x[kouchou.MAX_PLAYER_COUNT-1]=0
if kouchou.players_in==0 || kouchou.players_in==1
{
	show_error("error - players in game less than 2",true)
}
else if kouchou.players_in==2
{
	spawn_positions_x[0]=xl+bw*2
	spawn_positions_x[1]=xr-bw*2
}
else if kouchou.players_in==3
{
	spawn_positions_x[0]=xl+bw
	spawn_positions_x[1]=xm
	spawn_positions_x[2]=xr-bw
}
else if kouchou.players_in==4
{
	spawn_positions_x[0]=xl+bw
	spawn_positions_x[1]=xm-bw*2
	spawn_positions_x[2]=xm+bw*2
	spawn_positions_x[3]=xr-bw
}
if spawn_positions_x[0]==undefined
	show_error("spawn positions undefined",true)