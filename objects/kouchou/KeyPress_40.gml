if startinggame>0
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
    setmenu_select+=1
    if setmenu_select==6
        setmenu_select=0
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



