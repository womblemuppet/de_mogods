if room==menu
	instance_destroy()
if room==gameroom
{
	//audio_stop_sound(menoos)
	//audio_play_sound(playmoos,0,true)
	
	
	///////////////////////////////////////VIEWS AND CAMERAS////////////////////////////////////////////////////////////////////////////////////////
	
	for (var i = 0; i < 5; ++i) 
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
	
    
	view_set_wport(1,kouchou.room_left_border_x)
	view_set_hport(1,room_height)	
	lefthud_cam=camera_create_view(0,0,kouchou.room_left_border_x,room_height)
	view_set_camera(1,lefthud_cam)
	
	
	view_set_xport(2,kouchou.room_right_border_x)
	view_set_wport(2,kouchou.room_right_full-kouchou.room_right_border_x)
	view_set_hport(2,room_height)	
	righthud_cam=camera_create_view(kouchou.room_right_border_x,0,kouchou.room_right_full-kouchou.room_right_border_x,room_height)
	view_set_camera(2,righthud_cam)
	
	
	view_set_xport(3,kouchou.room_left_border_x)
	view_set_wport(3,kouchou.rw)
	view_set_hport(3,kouchou.room_top_border_y)	
	tophud_cam=camera_create_view(kouchou.room_left_border_x,0,kouchou.rw,kouchou.room_top_border_y)
	view_set_camera(3,tophud_cam)
	
	
	view_set_xport(4,kouchou.room_left_border_x)
	view_set_wport(4,kouchou.rw)
	view_set_yport(4,kouchou.room_bottom_border_y)
	view_set_hport(4,room_height-kouchou.room_bottom_border_y)	
	bottomhud_cam=camera_create_view(kouchou.room_left_border_x,kouchou.room_bottom_border_y,kouchou.rw,room_height-kouchou.room_bottom_border_y)
	view_set_camera(4,bottomhud_cam)

    
	blockstosprite=ds_list_create()    ///list of blocks to have sprite connecting script applied in aizen step event (optimized by doing all at once only once)
	blockstosprite_prevlayer=ds_list_create()  //list of blocks created that will need sprites to be reconnected when the next layer of blocks is made    //[finaledit] these need to be destroyed

	//////////////////////////////////////HUD VARIABLES - incase players stop existing hud will draw from these values instead of grabbing from player instance

	player_meter[kouchou.MAX_PLAYER_COUNT]=0
	for (i=0; i<kouchou.MAX_PLAYER_COUNT; i+=1)
	{
		player_meter[i]=0
	};   
         
	playersupercount[kouchou.MAX_PLAYER_COUNT]=0
	for (i=0; i<kouchou.MAX_PLAYER_COUNT; i+=1)
	{
		playersupercount[i]=0
	};       
    
	playerhpglow[kouchou.MAX_PLAYER_COUNT]=hud_floatingoogamask_glow
	for (i=0; i<kouchou.MAX_PLAYER_COUNT; i+=1)
	{
		playerhpglow[i]=hud_floatingoogamask_glow
	};
    
	playerpocketorb[kouchou.MAX_PLAYER_COUNT]=-1
	for (i=0; i<kouchou.MAX_PLAYER_COUNT; i+=1)
	{
		playerpocketorb[i]=-1
	};
    
	playerulttimeindex[3]=0
    
	playerorbcount[kouchou.MAX_PLAYER_COUNT]=-1
	for (i=0; i<kouchou.MAX_PLAYER_COUNT; i+=1)
	{
		playerorbcount[i]=0
	};
    
    
	player_draw_HUD[kouchou.MAX_PLAYER_COUNT]=false
	for (i=0; i<kouchou.MAX_PLAYER_COUNT; i+=1)
	{
		player_draw_HUD[i]=false
		if i<kouchou.playersin
			player_draw_HUD[i]=true
	};

    
    
	/***************************************************
	convert selectchar[] (player select selected character ID number) into character strings
	***************************************************/    
   
	tempcharstrings[kouchou.MAX_PLAYER_COUNT]=""
	for (i=0; i<kouchou.MAX_PLAYER_COUNT; i+=1)
	{
		switch kouchou.selectchar[i]
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
			show_error("unknown selectchar ID encountered during conversion to strings",true) break;
		}
	};
    
    

    
    
	////gives each controller slot (stored in tempcontrollerid) a player ID connected to it, to give the player object that slot later on.
	//// basically, this is to give player objects pad numbers
    

    
    
	var groundlevel;
	groundlevel=600
	var playerspawnheight;
	playerspawnheight=200
	instance_create(0,0,sky)
	instance_create(0,0,lighting)

    
	
	///////////////////////////////////////////////////////////////////// SPAWN LOCATIONS //////////////////////////////////////////////
	
	spawn_positions_x[kouchou.MAX_PLAYER_COUNT]=0
	if kouchou.playersin==0 || kouchou.playersin==1
	{
		show_error("error - players in game less than 2",true)
	}
	if kouchou.playersin==2
	{
		spawn_positions_x[0]=280
		spawn_positions_x[1]=920
	}
	if kouchou.playersin==3
	{
		spawn_positions_x[0]=280
		spawn_positions_x[1]=920
		spawn_positions_x[2]=600
	}
	if kouchou.playersin==4
	{
		spawn_positions_x[0]=280
		spawn_positions_x[1]=920
		spawn_positions_x[2]=560
		spawn_positions_x[3]=640
	}
	if spawn_positions_x[0]==undefined
		show_error("spawn positions undefined",true)
		
		
	////////////////////////////////////////////////////// SPAWNS	
		
		
	var a;
    
	for (i=0; i<kouchou.playersin; i+=1)
	{
		var ii;
		ii=i
		a=instance_create(spawn_positions_x[i],playerspawnheight,player)   //   -----------------SPAWN PLAYER-------------------
		with a
		{
			if x<kouchou.room_x_halfway/2
			{
				right=true
			}
			else
			{
				right=false
				image_xscale=-1
			}
            
			P=ii
			character=aizen.tempcharstrings[P]
			palette=kouchou.palette[P]
			H=3
			H+=kouchou.playerhandicap[P]
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
  
		}
	};
    
    
	if kouchou.map=="multiplayer"      ///for multiplayer, spawn torches and protection blocks
	{
        
		var prot;
		        prot=0  // [finaledit] obsolete?
		with spawn_block(kouchou.room_left_border_x,groundlevel-40,0)
		        protection=prot
		with spawn_block(kouchou.room_left_border_x+40,groundlevel-40,0)
		        protection=prot
		with spawn_block(kouchou.room_right_border_x-40,groundlevel-40,0)
		        protection=prot
		with spawn_block(kouchou.room_right_border_x,groundlevel-40,0)
		        protection=prot
            
		for (i=0; i<kouchou.rw; i+=40)
		{
			with spawn_block(kouchou.room_left_border_x+i,groundlevel,0)
				protection=prot
		};
		for (i=0; i<kouchou.rw; i+=40)
		{
			with spawn_block(kouchou.room_left_border_x+i,groundlevel+40,0)
				protection=prot
		};
		alarm[10]=300   ///time before first volcs spawn

		with block
		{
			if protection>0
				image_blend=c_silver
		}
	}
    
    
        
	with player
		sprite_index=sprites[0]
    
	biomeswitch=false   ///(I think) true when cutting gap between biomes

	for (iii=17; iii<61; iii+=1)   //row by row  
	{
		biomeswitch=false
		travelled+=40            
		bedrockcounter=41
		travelled_tick_biome_threshold_check()
		terrain_generate(iii*40)
	};
    
	//create fossil surface for first time
	redraw_fossil_surface()

	//fill list of blocks that will be drawn in draw event
	update_blocks_to_draw_list()
	
	
	if kouchou.map=="multiplayer"
	{
		alarm[0]=300    //orbs
	}
	else if kouchou.map=="firetrial"
	{
		instance_create(0,0,firetrial_control) 
	}
	else if kouchou.map=="icetrial"
	{
		instance_create(0,0,icetrial_control) 
	}
	else if kouchou.map=="stormtrial"
	{
		instance_create(0,0,stormtrial_control)
	}    

}

