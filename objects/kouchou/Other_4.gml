room_width=1350
room_height=768

if room==startup
{
	randomize()
	room_goto_next()
}
else if room==init
{
	spawn_aizen(-1)
	
	for (var i=0; i<players_in; i+=1)
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
			ds_map_add(keybinding_map_array[i],"startbutton",ord("R")) break;
            
			case "kb_left":
			ds_map_add(keybinding_map_array[i],"gamepad",false)
			ds_map_add(keybinding_map_array[i],"leftbutton",ord("A"))
			ds_map_add(keybinding_map_array[i],"rightbutton",ord("D"))
			ds_map_add(keybinding_map_array[i],"upbutton",ord("W"))
			ds_map_add(keybinding_map_array[i],"downbutton",ord("S"))
			ds_map_add(keybinding_map_array[i],"dashbutton",ord("C"))
			ds_map_add(keybinding_map_array[i],"lightbutton",ord("V"))
			ds_map_add(keybinding_map_array[i],"heavybutton",ord("B"))
			ds_map_add(keybinding_map_array[i],"startbutton",ord("R")) break; 
            
            
			case "kb_right":
			ds_map_add(keybinding_map_array[i],"gamepad",false)
			ds_map_add(keybinding_map_array[i],"leftbutton",ord("J"))
			ds_map_add(keybinding_map_array[i],"rightbutton",ord("L"))
			ds_map_add(keybinding_map_array[i],"upbutton",ord("I"))
			ds_map_add(keybinding_map_array[i],"downbutton",ord("K"))
			ds_map_add(keybinding_map_array[i],"dashbutton",$BE)
			ds_map_add(keybinding_map_array[i],"lightbutton",$BF)
			ds_map_add(keybinding_map_array[i],"heavybutton",vk_shift)
			ds_map_add(keybinding_map_array[i],"startbutton",vk_enter) break;          
            
			case "controller_default":
			ds_map_add(keybinding_map_array[i],"gamepad",true)
			ds_map_add(keybinding_map_array[i],"padnumber",aizen.temporary_player_controller_pad_numbers[i])
			ds_map_add(keybinding_map_array[i],"leftbutton",gp_padl)
			ds_map_add(keybinding_map_array[i],"rightbutton",gp_padr)
			ds_map_add(keybinding_map_array[i],"upbutton",gp_padu)
			ds_map_add(keybinding_map_array[i],"downbutton",gp_padd)
			ds_map_add(keybinding_map_array[i],"dashbutton",gp_face2)
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
else if room==multiplayermenu
{
	if competitive_mode==true
	{
		var a;
		a=create_menupart_basic(cupppp,0.01,room_width/2,room_height/2,-4,cup_hover_movement)
		a.vspeed=0.5
		a.gravity=0.1
	}
}