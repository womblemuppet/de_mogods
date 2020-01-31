with kouchou 
{
	if room==menu
	{
	    if main_menu_select=="exit"
	        game_end()
	    else
	    {
		    	with ds_map_find_value(main_menu_option_components,main_menu_select)
				main_menu_option_components_get_unselected()
			main_menu_select_number=MAIN_MENU_SELECT_NUMBER_MAX
			main_menu_select=main_menu_select_options[main_menu_select_number]
			with ds_map_find_value(main_menu_option_components,main_menu_select)
				main_menu_option_components_get_selected()
	    }
	}
	else if room==multiplayermenu
	{
	    room=menu
	}
	else if room==settings
	{
	    var OPT;
	    OPT=file_text_open_write("options.txt")
	    if OPT==-1
	        show_error("options file can not be created",true)
	    file_text_write_string(OPT,"fullscreen=")    
	    file_text_write_string(OPT,setmenu_fullscreen)
	    file_text_writeln(OPT)
	    file_text_write_string(OPT,"scale_screen=")    
	    file_text_write_string(OPT,setmenu_scale_screen)
	    file_text_writeln(OPT)
	    file_text_write_string(OPT,"eff_volume=")
	    file_text_write_string(OPT,setmenu_eff_volume)
	    file_text_writeln(OPT)
	    file_text_write_string(OPT,"bgm_volume=")
	    file_text_write_string(OPT,setmenu_bgm_volume)
	    file_text_writeln(OPT)
	    file_text_write_string(OPT,"show_fps=")   
	    if setmenu_show_fps==false
	        file_text_write_string(OPT,"0")
	    else
	        file_text_write_string(OPT,"1")    
	   
	    file_text_write_string(OPT,setmenu_eff_volume)
	    file_text_writeln(OPT)
	    file_text_write_string(OPT,"block_width=")
	    file_text_write_string(OPT,setmenu_block_width)
	    file_text_writeln(OPT)
	    file_text_write_string(OPT,"block_height=")   
	    file_text_write_string(OPT,setmenu_block_height)

	    file_text_close(OPT)   
	    show_debug_message("options saved")
    
	    window_set_fullscreen(setmenu_fullscreen)
	    room=menu
    
	}
	else if room==loremenu
	{
	    if lorebackselect==true
	        room=menu
	    else
	        lorebackselect=true
	}

}
