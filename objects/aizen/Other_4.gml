if room==menu
	instance_destroy()
if room==gameroom
{

	///////////////////////////////////////VIEWS AND CAMERAS////////////////////////////////////////////////////////////////////////////////////////
	
	for (var i = 0; i < 2; i++) 
	{
		view_visible[i]=true
		view_enabled[i]=true
	}
	
	view_set_xport(0,kouchou.room_left_border_x)
	view_set_yport(0,kouchou.room_top_border_y)
	view_set_wport(0,kouchou.rw)
	view_set_hport(0,kouchou.rh)
	main_cam=camera_create_view(kouchou.room_left_border_x,kouchou.room_top_border_y,kouchou.rw,kouchou.rh)
	view_set_camera(0,main_cam)
	camera_set_view_pos(main_cam,kouchou.room_left_border_x,kouchou.room_top_border_y)
	
    
	//view_set_wport(1,kouchou.room_left_border_x)
	//view_set_hport(1,room_height)	
	//lefthud_cam=camera_create_view(0,0,kouchou.room_left_border_x,room_height)
	//view_set_camera(1,lefthud_cam)
	
	
	//view_set_xport(2,kouchou.room_right_border_x)
	//view_set_wport(2,kouchou.room_right_full-kouchou.room_right_border_x)
	//view_set_hport(2,room_height)	
	//righthud_cam=camera_create_view(kouchou.room_right_border_x,0,kouchou.room_right_full-kouchou.room_right_border_x,room_height)
	//view_set_camera(2,righthud_cam)
	
	 
	view_set_xport(1,kouchou.room_left_border_x)
	view_set_wport(1,kouchou.rw)
	view_set_hport(1,kouchou.room_top_border_y)	
	tophud_cam=camera_create_view(kouchou.room_left_border_x,0,kouchou.rw,kouchou.room_top_border_y)
	view_set_camera(1,tophud_cam)
	
	
	//view_set_xport(4,kouchou.room_left_border_x)
	//view_set_wport(4,kouchou.rw)
	//view_set_yport(4,kouchou.room_bottom_border_y)
	//view_set_hport(4,room_height-kouchou.room_bottom_border_y)	
	//bottomhud_cam=camera_create_view(kouchou.room_left_border_x,kouchou.room_bottom_border_y,kouchou.rw,room_height-kouchou.room_bottom_border_y)
	//view_set_camera(4,bottomhud_cam)

	instance_create_depth(0,0,-4,borderviews)
	instance_create_depth(0,0,0,combo_text_controller)
	instance_create_depth(0,0,-5,console)
	instance_create_depth(0,0,-6,top_HUD)

		

    
	blockstosprite=ds_list_create()    ///list of blocks to have sprite connecting script applied in aizen step event (optimized by doing all at once only once)
	blockstosprite_prevlayer=ds_list_create()  //list of blocks created that will need sprites to be reconnected when the next layer of blocks is made    //[finaledit] these need to be destroyed

   

    
    
	/***************************************************
	convert selected_character_id[] (player select selected character ID number) into character strings
	***************************************************/    
   
	tempcharstrings[kouchou.MAX_PLAYER_COUNT-1]=""
	for (var i=0; i<kouchou.MAX_PLAYER_COUNT; i+=1)
	{
		switch kouchou.selected_character_id[i]
		{
			case 0:
				tempcharstrings[i]="ooga" break;
			case 1:
				tempcharstrings[i]="veteran" break;
			case 2:
				tempcharstrings[i]="slinger" break;
			case 3:
				tempcharstrings[i]="bait" break;
			default:
				show_error("unknown selected_character_id ID encountered during conversion to strings",true) break;
		}
	};
    

	var groundlevel;
	groundlevel=600
	var playerspawnheight;
	playerspawnheight=200
	instance_create(0,0,sky)
	instance_create(0,0,lighting)    
	
	find_starting_spawn_locations()
		
		
	////////////////////////////////////////////////////// SPAWNS	
	var a;
    
	for (var i=0; i<kouchou.players_in; i+=1)
	{
		var ii;
		ii=i
		a=instance_create(spawn_positions_x[i],playerspawnheight,player)   //   -----------------SPAWN PLAYER-------------------
		with a
		{
			P=ii
			if P % 2==1
				image_blend=c_orange
			
			character=aizen.tempcharstrings[P]
			palette=kouchou.palette[P]
			H=kouchou.starting_hp
			H+=kouchou.playerhandicap[P]
			player_update_hh_indicator()
			
			scale=kouchou.setmenu_player_scale
			image_xscale=scale
			image_yscale=scale
			
			if x<kouchou.room_x_halfway/2
			{
				right=true
			}
			else
			{
				right=false
				image_xscale=-image_xscale
			}
            
			decide_sprites() //////////////////////////////////// character setup
			decide_sprite_hierarchy_lists()
			decide_moves()

			///////////////////////////////////////////////////// controls
			gamepad=ds_map_find_value(kouchou.keybinding_map_array[P],"gamepad")
			leftbutton=ds_map_find_value(kouchou.keybinding_map_array[P],"leftbutton")
			rightbutton=ds_map_find_value(kouchou.keybinding_map_array[P],"rightbutton")
			upbutton=ds_map_find_value(kouchou.keybinding_map_array[P],"upbutton")
			downbutton=ds_map_find_value(kouchou.keybinding_map_array[P],"downbutton")
			dashbutton=ds_map_find_value(kouchou.keybinding_map_array[P],"dashbutton")
			lightbutton=ds_map_find_value(kouchou.keybinding_map_array[P],"lightbutton")
			heavybutton=ds_map_find_value(kouchou.keybinding_map_array[P],"heavybutton")
			startbutton=ds_map_find_value(kouchou.keybinding_map_array[P],"startbutton")
			if gamepad
				padnumber=ds_map_find_value(kouchou.keybinding_map_array[P],"padnumber")

			var b;
			b=instance_create_depth(x,y,-4,ef_timed_indicator)
			b.targ=id
			b.sprite_index=playernumberindicators
			b.image_speed=0
			b.image_index=P
			b.alarm[0]=120
			b.vspeed=-0.001
			b.friction=-0.001
			b.image_xscale=0.9
			b.image_yscale=0.9
			
			player_set_up_HUD()
			attack_start_groundpound_descent("ground pound")
			vspd=7
			sprite_index=sprites[? "gpfall"]
		}
	};
	biomeswitch=false   ///true when cutting gap between biomes
	travelled=0      ////total distance in pixels that the screen has scrolled down
	
	debug_amount_scrolled_since_last_tergen=0
	
	terrain_generate_at_start()
	
	//create fossil surface for first time
	redraw_fossil_surface()

	//fill list of blocks that will be drawn in draw event
	update_blocks_to_draw_list()
	
	scroll_threshold=kouchou.room_bottom_border_y-bh*4    ///screen starts scrolling when lower than this
	
	//if kouchou.map=="multiplayer"
	//{
	//	//
	//}
	//else if kouchou.map=="firetrial"
	//{
	//	instance_create(0,0,firetrial_control) 
	//}
	//else if kouchou.map=="icetrial"
	//{
	//	instance_create(0,0,icetrial_control) 
	//}
	//else if kouchou.map=="stormtrial"
	//{
	//	instance_create(0,0,stormtrial_control)
	//}    

}

