if y<kouchou.room_top_border_y-10
{
	if recovery_groundpound_counter>0
		recovery_groundpound_counter+=1

	if dash_rocket_top_collision_safety<1 && recovery_groundpound_counter<1
	{
		y-=200
		losehp(false,"falling")
		recovery_groundpound_counter=10
		show_debug_message("rec gp counter"+string(recovery_groundpound_counter))
		player_make_vunerable()
		var a;
		a=attack_start_groundpound_descent()
		with a
			instance_change(hitbox_recovery_groundpound,true)	
	}
}