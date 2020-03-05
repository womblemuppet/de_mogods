/// scrolling and terrain gen
var lowest_player_y;
lowest_player_y=0

for (var i=0; i<instance_number(player); i+=1)
{
	if instance_find(player,i).y>lowest_player_y
		lowest_player_y=instance_find(player,i).y
};
	
if lowest_player_y>player_baseline
	player_baseline=lowest_player_y
	
var player_baseline_difference
player_baseline_difference=player_baseline-player_baseline_prev


player_baseline_prev=player_baseline


if lowest_player_y>=SCROLL_THRESHOLD 
{
	///scroll camera
	var scrollspeed;
	scrollspeed=5
	
	timeSinceLastScrolled=0
	
	with scrolls     ///scroll objects down with the 'view'
		y-=scrollspeed

	with block       ///kill blocks outside the map
	{
		if y<-80
			instance_destroy()        
	}
	with player      ///kill players above the top boundary
	{
		if dash_rocket_top_collision_safety_on==true
		{
			if !place_meeting(x,y+scrollspeed,block)
				y+=scrollspeed
		}
		if chained_debuff_counter>0
		{
			chained_debuff_y_pos-=scrollspeed
			chain_id_to_delete.y-=scrollspeed
		}
	}
	with teleport
	{
		if y<60
		{
			if instance_exists(creator)
				with creator
					attack_bait_reset_teleport()

			instance_destroy()
		}
	}

	
	will_update_blocks_to_draw_list=true	
	travelled+=scrollspeed             ///add to travelled, total distance scrolled downward
	
	debug_amount_scrolled_since_last_tergen+=scrollspeed
	
	player_baseline-=scrollspeed	
	player_baseline_prev-=scrollspeed   ///player_baseline_difference should be relative



	if kouchou.map=="multiplayer"          //////////// biome background stuff for multiplayer map 
	{
		with mountains_backdrop
		{
			if y>room_height-sprite_height 
				y-=2.5
			if aizen.travelled>aizen.mountainscrolllevel
				y-=scrollspeed
			if y+sprite_height<0
				instance_destroy()
		}
		if travelled>mountainlevel && !mountains_have_spawned
		{
			instance_create(kouchou.room_left_border_x,room_height,mountains_backdrop)
			mountains_have_spawned=true
		} 

		travelled_tick_biome_threshold_check()
	}
}
else
	timeSinceLastScrolled++

scrolled_amount+=player_baseline_difference        ///add to scrolled_amount, ticker for creating new blocks
total_baseline_movement+=player_baseline_difference
//if player_baseline_difference!=0
	//show_debug_message("baseline difference is:"+string(player_baseline_difference)+", scrolled_amount is now:"+string(scrolled_amount)+" baseline is now:"+string(player_baseline))
	
surface_redraw_counter+=player_baseline_difference
if surface_redraw_counter>SURFACE_REDRAW_INTERVAL
{
	fossil_surface_redraw_needed=true
	surface_redraw_counter-=SURFACE_REDRAW_INTERVAL
}




/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////   set all sprites for necessary blocks
if !ds_list_empty(blockstosprite)
{
	for (var i=0; i<ds_list_size(blockstosprite); i+=1)
	{
		with ds_list_find_value(blockstosprite,i)
		{
			block_setup_sprites()
		}
	};
    
	ds_list_clear(blockstosprite)
	fossil_surface_redraw_needed=true
}

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////   remake surface if it gets destroyed
if !surface_exists(fossil_surface)
	fossil_surface_redraw_needed=true
    

	
if call_a_block_has_been_destroyed
{
	a_block_has_been_destroyed()	
	call_a_block_has_been_destroyed=false
}
	
if will_update_blocks_to_draw_list==true
{
	update_blocks_to_draw_list()
	will_update_blocks_to_draw_list=false
}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// pause
for (var i=0; i<kouchou.players_in; i+=1)   ////[finaledit] using players_in might cause slot problems?
{
	gamepad=ds_map_find_value(kouchou.keybinding_map_array[i],"gamepad")    ///sets gamepad and padnumber variables for input scripts. [finaledit] bandaid solution -  should have a better system.
	if gamepad
		padnumber=ds_map_find_value(kouchou.keybinding_map_array[i],"padnumber")
		

	/////////////////////////////////////////////////////////////////////////////////////////////////////PAUSE SCREEN REQUEST
	if !debug    ///prevents menu opening if console is active
	{
		if checkkey_released(ds_map_find_value(kouchou.keybinding_map_array[i],"startbutton"))
		{
			if pausescreen_doubletap_counter<1
			{
				pausescreen_requester_id=i
				alarm[11]=2   ///delay
				pausescreen_doubletap_counter=20
			}
		}
	}
};





terrain_generate(player_baseline+CREATIONDELAY-scrolled_amount)