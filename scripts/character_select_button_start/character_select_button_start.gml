/*
	argument0 = slot
*/

if ready[argument0]==0       
{
	ready[argument0]+=1
}
else if ready[argument0]==1                                                                                        /// lock in P1
{
	ready[argument0]=2
	if player_check_all_ready()
	{
		effect_create_above(ef_firework,room_width/2,room_height/2,2,c_white)
		game_start_countdown=75
	}
}