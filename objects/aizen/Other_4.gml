if room==menu
	instance_destroy()
if room==gameroom
{
	//audio_stop_sound(menoos)
	//audio_play_sound(playmoos,0,true)
    
	__view_set( e__VW.XView, 0, kouchou.room_left_border_x )
	__view_set( e__VW.YView, 0, kouchou.room_top_border_y )
    
	__view_set( e__VW.WView, 0, kouchou.rw )
	__view_set( e__VW.HView, 0, kouchou.rh )
	__view_set( e__VW.WPort, 0, kouchou.rw )
	__view_set( e__VW.HPort, 0, kouchou.rh )
    
	__view_set( e__VW.WView, 1, kouchou.room_left_border_x )
	__view_set( e__VW.WPort, 1, kouchou.room_left_border_x )
	__view_set( e__VW.HView, 1, room_height )
	__view_set( e__VW.HPort, 1, room_height )
    
	__view_set( e__VW.XView, 2, kouchou.room_right_border_x )
	__view_set( e__VW.WView, 2, kouchou.room_right_full-kouchou.room_right_border_x )
	__view_set( e__VW.HView, 2, room_height )
	__view_set( e__VW.WPort, 2, kouchou.room_right_full-kouchou.room_right_border_x )
	__view_set( e__VW.HPort, 2, room_height )
    
	__view_set( e__VW.XPort, 0, kouchou.room_left_border_x )
	__view_set( e__VW.YPort, 0, kouchou.room_top_border_y )
    
	__view_set( e__VW.XPort, 2, kouchou.room_right_border_x )

	__view_set( e__VW.XView, 3, kouchou.room_left_border_x )
	__view_set( e__VW.XPort, 3, kouchou.room_left_border_x )
	__view_set( e__VW.WView, 3, kouchou.rw )
	__view_set( e__VW.WPort, 3, kouchou.rw )
	__view_set( e__VW.HView, 3, kouchou.room_top_border_y )
	__view_set( e__VW.HPort, 3, kouchou.room_top_border_y )
    
	__view_set( e__VW.XView, 4, kouchou.room_left_border_x )
	__view_set( e__VW.XPort, 4, kouchou.room_left_border_x )
	__view_set( e__VW.WView, 4, kouchou.rw )
	__view_set( e__VW.WPort, 4, kouchou.rw )
	__view_set( e__VW.YView, 4, kouchou.room_bottom_border_y )
	__view_set( e__VW.YPort, 4, kouchou.room_bottom_border_y )
	__view_set( e__VW.HView, 4, room_height-kouchou.room_bottom_border_y )
	__view_set( e__VW.HPort, 4, room_height-kouchou.room_bottom_border_y )

	__view_set( e__VW.Visible, 0, true )
	__view_set( e__VW.Visible, 1, true )
	__view_set( e__VW.Visible, 2, true )
	__view_set( e__VW.Visible, 3, true )
	__view_set( e__VW.Visible, 4, true )
    
	blockstosprite=ds_list_create()    ///list of blocks to have sprite connecting script applied in aizen step event (optimized by doing all at once only once)
	blockstosprite_prevlayer=ds_list_create()  //list of blocks created that will need to sprites to be reconnected when the next layer of blocks is made    //[finaledit] these need to be destroyed

    
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
	convert selectchar[] code into character string and store it in array
	***************************************************/    
   
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
	instance_create(0,0,block_drawer)
    
	spawn_positions[kouchou.MAX_PLAYER_COUNT]=0
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
		/*a=instance_create(40,groundlevel-80,torch)     create torches  
		a.sprite_index=torch_sprite
		a=instance_create(1160,groundlevel-80,torch)
		a.sprite_index=torchBLOO*/
        
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



/* */
/*  */
