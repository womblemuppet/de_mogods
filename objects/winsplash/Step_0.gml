if dying
{
    if image_alpha>0
        image_alpha-=0.05

        
    if !startcheck
    {
        for (i=0; i<kouchou.players_in; i+=1)  
        {
            gamepad=ds_map_find_value(kouchou.keybinding_map_array[i],"gamepad")
            if gamepad==true
                padnumber=ds_map_find_value(kouchou.keybinding_map_array[i],"padnumber")
                
            if checkkey(ds_map_find_value(kouchou.keybinding_map_array[i],"lightbutton"))   ///[finaledit] could optimize by storing once in create
                startcheck=true
        }
        
        
        if startcheck
           aizen.alarm[7]=5
   }
}





