if keyboard_check_pressed(keyboard1_start_button) || keyboard_check_pressed(keyboard2_start_button)
	return true

for (i=0; i<12; i+=1)
{
    if controller_player_id[i]==-1 && gamepad_is_connected(i) && gamepad_button_check_pressed(i,gp_start)
    {
		return true
    }
};

return false