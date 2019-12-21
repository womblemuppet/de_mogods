////horizontal movement ( direction change disabled during special attacks like whirlwind)
if !player_is_stunned() && (cangroundpound==0 || cangroundpound==3) 
&& (dashcd<DASH_COOLDOWN_TIME-DASH_LOCKDOWN_TIME || dash_wallbreak_forgive==true) 
&& airgrab_mode!="is_grabbing" && airgrab_mode!="being_airgrabbed" 
&&  ( !uniques_whirlwind_active || uniques_whirlwind_teleport_direction_change_leeway_counter>0 ) 
&& !is_proned
{
	if button_scrape[? rightbutton]
		player_set_horizontal_movement_and_facingdir("right")	
	else if button_scrape[? leftbutton]
		player_set_horizontal_movement_and_facingdir("left")
}


//reset running counter if not holding left or right and player is stopped
if (!button_scrape[? leftbutton] && !button_scrape[? rightbutton]) && hspd==0
	hor_running_counter=0
