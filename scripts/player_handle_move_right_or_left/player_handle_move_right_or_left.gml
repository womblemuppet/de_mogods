////first checks are if player can swap direction (disabled for things like whirlwind)
if stunned_groundpound<1 && (cangroundpound==0 || cangroundpound==3) && (dashcd<DASH_COOLDOWN_TIME-DASH_LOCKDOWN_TIME || dash_wallbreak_forgive==true) && airgrab_mode!=2 && airgrab_mode!=4 && !uniques_whirlwind_active
{
	if checkkey(leftbutton) && !checkkey(rightbutton)
		player_set_horizontal_movement("left")
	if checkkey(rightbutton)
		player_set_horizontal_movement("right")	
}
if (!checkkey(leftbutton) && !checkkey(rightbutton)) && hspd==0
{
	hor_running_counter=0
}