/// @description pause screen

var a;
a=instance_create(0,0,pauser)
a.pausescreen_requester_id=pausescreen_requester_id



with a
{
	pause_screencap=surface_create(room_width,room_height)
	surface_copy(pause_screencap,0,0,application_surface)
	instance_deactivate_all(true)
	instance_activate_object(kouchou)
	gamepad=ds_map_find_value(kouchou.keybinding_map_array[pausescreen_requester_id],"gamepad")
	if gamepad
		padnumber=ds_map_find_value(kouchou.keybinding_map_array[pausescreen_requester_id],"padnumber")
	//show_debug_message("GAMEPAD")
	//show_debug_message(gamepad)
}


