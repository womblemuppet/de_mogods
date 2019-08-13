if game_start_countdown>0
    exit

if room==loremenu
{
    if lorebackselect==true
        lorebackselect=false    
}
if room==settings
{
	if setmenu_select=="fullscreen"
	{
		setmenu_fullscreen=!setmenu_fullscreen        
	}
	else if setmenu_select=="scale_screen"
	{
		setmenu_scale_screen=!setmenu_scale_screen
	}
	else if setmenu_select=="sound_effects_volume"
	{
		if setmenu_eff_volume<100
		     setmenu_eff_volume+=10
	}
	else if setmenu_select=="background_music_volume"
	{
		if setmenu_bgm_volume<100
		     setmenu_bgm_volume+=10
	}
	else if setmenu_select=="fps_counter"
	{
		setmenu_show_fps=!setmenu_show_fps
	} 
}



