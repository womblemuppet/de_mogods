var playerId;
playerId=argument0

if ready[playerId]==0       
{
	ready[playerId]=1
	player_character_chosen_event(playerId)
}
else if ready[playerId]==1                                                                                        /// lock in P1
{
	ready[playerId]=2
	player_locked_in_components_event(playerId)
	if player_check_all_ready()
	{
		effect_create_above(ef_firework,room_width/2,room_height/2,2,c_white)
		game_start_countdown=75
	}
}