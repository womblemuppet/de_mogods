////horizontal movement (disabled for things like whirlwind,gpstun)
if stunned_groundpound<1 && (cangroundpound==0 || cangroundpound==3) && (dashcd<DASH_COOLDOWN_TIME-DASH_LOCKDOWN_TIME || dash_wallbreak_forgive==true) && airgrab_mode!="is_grabbing" && airgrab_mode!="being_airgrabbed" && !uniques_whirlwind_active && !is_proned
{
	if button_scrape[? leftbutton] && !button_scrape[? rightbutton]
		player_set_horizontal_movement_and_facingdir("left")
	if button_scrape[? rightbutton]
		player_set_horizontal_movement_and_facingdir("right")	
} 
if (!button_scrape[? leftbutton] && !button_scrape[? rightbutton]) && hspd==0
{
	hor_running_counter=0
}