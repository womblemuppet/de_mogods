/*if !audio_is_playing(menoos)
{
    audio_stop_sound(playmoos)
    audio_play_sound(menoos,0,true)
}*/




///take control of app surface
application_surface_draw_enable(false)  ///has to be called each room start


if room==init
{
    
	var a;
	a=instance_create(x,y,aizen)    ///the birth of a monster
	a.player_priority=irandom(players_in-1)+1
	with a
	{
		tempcontrollerid[12]=-1
		for (i=0; i<12; i+=1)
		{
			tempcontrollerid[i]=-1
		};
        
	for (i=0; i<12; i+=1)
	{
		if kouchou.controller_player_id[i]!=-1
		{
			tempcontrollerid[kouchou.controller_player_id[i]]=i
			//show_message("setting tempcontrollerid "+string(kouchou.controller_player_id[i])+" to "+string(i))
		}
	};
}
    
	for (i=0; i<players_in; i+=1)
	{
		keybinding_map_array[i]=ds_map_create()
		ds_map_add(keybinding_map_array[i],"controlsetup",control_setup[i])
		///////////////////////////////////////////////////// controls
		switch control_setup[i]
		{
			case "kb_full":
			ds_map_add(keybinding_map_array[i],"gamepad",false)
			ds_map_add(keybinding_map_array[i],"leftbutton",ord("A"))
			ds_map_add(keybinding_map_array[i],"rightbutton",ord("D"))
			ds_map_add(keybinding_map_array[i],"upbutton",ord("W"))
			ds_map_add(keybinding_map_array[i],"downbutton",ord("S"))
			ds_map_add(keybinding_map_array[i],"dashbutton",ord("B"))
			ds_map_add(keybinding_map_array[i],"lightbutton",ord("N"))
			ds_map_add(keybinding_map_array[i],"heavybutton",ord("M"))
			ds_map_add(keybinding_map_array[i],"startbutton",vk_space) break;
            
			case "kb_left":
			ds_map_add(keybinding_map_array[i],"gamepad",false)
			ds_map_add(keybinding_map_array[i],"leftbutton",ord("A"))
			ds_map_add(keybinding_map_array[i],"rightbutton",ord("D"))
			ds_map_add(keybinding_map_array[i],"upbutton",ord("W"))
			ds_map_add(keybinding_map_array[i],"downbutton",ord("S"))
			ds_map_add(keybinding_map_array[i],"dashbutton",ord("C"))
			ds_map_add(keybinding_map_array[i],"lightbutton",ord("V"))
			ds_map_add(keybinding_map_array[i],"heavybutton",ord("B"))
			ds_map_add(keybinding_map_array[i],"startbutton",vk_space) break; 
            
            
			case "kb_right":
			ds_map_add(keybinding_map_array[i],"gamepad",false)
			ds_map_add(keybinding_map_array[i],"leftbutton",ord("J"))
			ds_map_add(keybinding_map_array[i],"rightbutton",ord("L"))
			ds_map_add(keybinding_map_array[i],"upbutton",ord("I"))
			ds_map_add(keybinding_map_array[i],"downbutton",ord("K"))
			ds_map_add(keybinding_map_array[i],"dashbutton",$BE)  //?
			ds_map_add(keybinding_map_array[i],"lightbutton",$BF)
			ds_map_add(keybinding_map_array[i],"heavybutton",vk_shift)
			ds_map_add(keybinding_map_array[i],"startbutton",vk_enter) break;          
            
			case "controller_default":
			ds_map_add(keybinding_map_array[i],"gamepad",true)
			ds_map_add(keybinding_map_array[i],"padnumber",aizen.tempcontrollerid[i])
			ds_map_add(keybinding_map_array[i],"leftbutton",gp_padl)
			ds_map_add(keybinding_map_array[i],"rightbutton",gp_padr)
			ds_map_add(keybinding_map_array[i],"upbutton",gp_face1)
			ds_map_add(keybinding_map_array[i],"downbutton",gp_padd)
			ds_map_add(keybinding_map_array[i],"dashbutton",gp_face2)  //?
			ds_map_add(keybinding_map_array[i],"lightbutton",gp_face3)
			ds_map_add(keybinding_map_array[i],"heavybutton",gp_face4)
			ds_map_add(keybinding_map_array[i],"startbutton",gp_start) break;              
		}
	}
}
else if room==menu
{
	selected_character_id[0]=0
	selected_character_id[1]=0
	selected_character_id[2]=0
	selected_character_id[3]=0
	readymenuselect[0]=0    
	readymenuselect[1]=0
	readymenuselect[2]=0
	readymenuselect[3]=0
	ready[0]=-1
	ready[1]=-1
	ready[2]=-1
	ready[3]=-1
	player_join_update_controller_variables()
}