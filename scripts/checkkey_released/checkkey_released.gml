if !gamepad
    return keyboard_check_released(argument0)

if gamepad
{
	if gamepad_button_check_released(padnumber,argument0)
		return true
	else
	{
		if argument0==gp_padr && (kouchou.stick_pressed_r[P]==3)
			return true
		if (argument0==gp_padu || argument0==gp_face1) && (kouchou.stick_pressed_u[P]==3 )
			return true
		if argument0==gp_padl && (kouchou.stick_pressed_l[P]==3 )
			return true
		if argument0==gp_padd && (kouchou.stick_pressed_d[P]==3)
			return true
		return false
	}
}
