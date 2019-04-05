with (kouchou) {
if room==menu
{
    if menuselect==MENUSELECTMAX-1
        game_end()
    else
        menuselect=MENUSELECTMAX-1
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
    file_text_write_string(OPT,"graphics_fid=")
    file_text_write_string(OPT,setmenu_graphics_fid)
    file_text_writeln(OPT)
    file_text_write_string(OPT,"eff_volume=")
    file_text_write_string(OPT,setmenu_bgm_volume)
    file_text_writeln(OPT)
    file_text_write_string(OPT,"bgm_volume=")
    file_text_write_string(OPT,setmenu_graphics_fid)
    file_text_writeln(OPT)
    file_text_write_string(OPT,"show_fps=")   
    if setmenu_show_fps==false
        file_text_write_string(OPT,"0")
    else
        file_text_write_string(OPT,"1")    
    file_text_close(OPT)   
    //show_message("options saved")
    
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
