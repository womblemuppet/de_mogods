room_width=1350
room_height=768

if room==startup
{
	randomize()
	room_goto_next()
}
else if room==init
{
	spawn_aizen(-1)
}
else if room==menu
{
	selected_character_id[0]=0
	selected_character_id[1]=0
	selected_character_id[2]=0
	selected_character_id[3]=0
	readymenuselect[0]=0    
	readymenuselect[1]=0
	readymenuselect[2]=0
	readymenuselect[3]=0
	ready[0]=-1
	ready[1]=-1
	ready[2]=-1
	ready[3]=-1
	player_join_update_controller_variables()
}