if !gamepad
	return keyboard_check(argument0)

//gamepad
if gamepad_button_check(padnumber,argument0)
	return true
else
{
	if argument0==gp_padr && (kouchou.stick_pressed_r[P]==1 || kouchou.stick_pressed_r[P]==2)
		return true
	if argument0==gp_padu && (kouchou.stick_pressed_u[P]==1 || kouchou.stick_pressed_u[P]==2)
		return true
	if argument0==gp_padl && (kouchou.stick_pressed_l[P]==1 || kouchou.stick_pressed_l[P]==2)
		return true
	if argument0==gp_padd && (kouchou.stick_pressed_d[P]==1 || kouchou.stick_pressed_d[P]==2)
		return true

}
if argument0==gp_padu 
{
	if gamepad_button_check(padnumber,gp_face1)
		return true
}
	
return false

