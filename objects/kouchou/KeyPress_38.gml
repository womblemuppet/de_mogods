if game_start_countdown>0
    exit
        
if room==menu
{
    menuselect-=1
    if menuselect==-1
        menuselect=4
    if menuselect==0 ///singleplayer disabled
       menuselect=MENUSELECTMAX-1
}
if room==settings
{
    setmenu_select-=1
    if setmenu_select==-1
        setmenu_select=5
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


