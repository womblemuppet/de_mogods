if game_start_countdown>0
    exit
        
if room==menu
{
	main_menu_select_number-=1
	if main_menu_select_number==-1
		main_menu_select_number=MAIN_MENU_SELECT_NUMBER_MAX

	main_menu_select=main_menu_select_options[main_menu_select_number]

	while main_menu_select=="single_player" || main_menu_select=="party_mode" || main_menu_select=="lore"   ///disabled options
	{
		main_menu_select_number-=1
		
		if main_menu_select_number==-1
			main_menu_select_number=MAIN_MENU_SELECT_NUMBER_MAX
		
		main_menu_select=main_menu_select_options[main_menu_select_number]
	}
	
}
if room==settings
{
	setmenu_select_number-=1
	if setmenu_select_number==-1
		setmenu_select_number=SETMENU_SELECT_NUMBER_MAX
		
	setmenu_select=setmenu_select_options[setmenu_select_number]
	
	
	if setmenu_select=="scale_screen" && setmenu_fullscreen==false
	{
		setmenu_select_number-=1
		setmenu_select=setmenu_select_options[setmenu_select_number]	
	}	
}

if room==loremenu
{
    loreselect-=1
    if loreselect-2<lorescroll && lorescroll>0
        lorescroll-=1
    if loreselect<0
    {
        loreselect=ds_list_size(lore_list)-1
        lorescroll=ds_list_size(lore_list)-LORELISTNUMBER+1
    }
}


