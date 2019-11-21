var playerid;
playerid=argument0

if ready[playerid]==0       
{
	ready[playerid]=1
}
else if ready[playerid]==1                                                                                        /// lock in P1
{
	ready[playerid]=2
	if player_check_all_ready()
	{
		effect_create_above(ef_firework,room_width/2,room_height/2,2,c_white)
		game_start_countdown=75
	}
}