if game_start_countdown>0
    exit

if room==menu
{
    menuselect+=1
    if menuselect==MENUSELECTMAX
        menuselect=0
    if menuselect==0   ///singleplayer disabled
       menuselect=1
}
if room==settings
{
    setmenu_select_number+=1
    if setmenu_select_number==SETMENU_SELECT_NUMBER_MAX
        setmenu_select_number=0
	   
	setmenu_select=setmenu_select_options[setmenu_select_number]
}


if room==loremenu
{
    loreselect+=1
    if loreselect>lorescroll+LORELISTNUMBER-2
        lorescroll+=1
    if loreselect>ds_list_size(lore_list)-1
    {
        loreselect=0
        lorescroll=0
    }

}



