if game_start_countdown>0
    exit

if room==loremenu
{
    if lorebackselect==true
        lorebackselect=false    
}
if room==settings
{
    if setmenu_select==0
    {
        setmenu_fullscreen=!setmenu_fullscreen        
    }
    else if setmenu_select==1
    {
        if setmenu_eff_volume<100
            setmenu_eff_volume+=10
    }
    else if setmenu_select==2
    {
        if setmenu_bgm_volume<100
            setmenu_bgm_volume+=10
    }
    else if setmenu_select==3
    {
        setmenu_show_fps=!setmenu_show_fps
    } 
}



