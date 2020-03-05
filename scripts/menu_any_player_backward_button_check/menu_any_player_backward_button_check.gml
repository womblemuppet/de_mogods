if keyboard_check_pressed(kb1_backward_button) || keyboard_check_pressed(kb2_backward_button) || keyboard_check_pressed(vk_escape)
	return true

for (var i=0; i<12; i+=1)
{
    if controller_player_slot[i]!=-1 && gamepad_is_connected(i) && gamepad_button_check_pressed(i,gp_face4)
    {
		return true
    }
};

return false