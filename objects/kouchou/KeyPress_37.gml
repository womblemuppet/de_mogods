if game_start_countdown>0
    exit
    
if room==loremenu
{
    if lorebackselect==false
        lorebackselect=true
}
if room==settings
{
    if setmenu_select==0
    {
        setmenu_fullscreen=!setmenu_fullscreen        
    }
    else if setmenu_select==1
    {
        setmenu_graphics_fid=!setmenu_graphics_fid
    }
    else if setmenu_select==2
    {
        if setmenu_eff_volume>0
            setmenu_eff_volume-=10
    }
    else if setmenu_select==3
    {
        if setmenu_bgm_volume>0
            setmenu_bgm_volume-=10
    }
    else if setmenu_select==4
    {
        setmenu_show_fps=!setmenu_show_fps
    } 
}


