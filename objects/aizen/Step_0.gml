bloodmoon_recalc_call=false

if pausescreen_doubletap_counter>0
	pausescreen_doubletap_counter-=1

warning_subimage+=1
if warning_subimage>9
	warning_subimage=0


hudfloatingmasks_subimage+=0.2
if hudfloatingmasks_subimage>HUDFLOATINGMASKS_IMAGE_NUMBER
	hudfloatingmasks_subimage=0



for (var i = 0; i < kouchou.MAX_PLAYER_COUNT; i++)
{
	hudpocketcircle_subimage[i]+=0.2
	
	if hudpocketcircle_subimage[i]>hudpocketcircle_image_number[i]
	{
		hudpocketcircle_subimage[i]=0
	
		if hud_pocket_circle_sprite[i]==hud_pocket_circle_area_orb_lost
		{
			hud_pocket_circle_sprite[i]=hud_pocket_circle_area
			hudpocketcircle_image_number[i]=HUD_POCKET_CIRCLE_AREA_IMAGE_NUMBER
		}
	}
}


for (var i = 0; i < kouchou.MAX_PLAYER_COUNT; i++)
{
	if hud_player_ult_time_remaining[i]>0
		hud_player_ult_time_remaining[i]-=1
}


stackframe_subimage+=0.2
if stackframe_subimage>stackframe_image_number
{
	stackframe_subimage=0    
}

fossil_surface_redraw_needed=false



if first_blood_neutral_cooldown>0
	first_blood_neutral_cooldown-=1
///////////////////////                                                           neutral first blood event                                                                     ///////////////////////////////////////
if first_blood_neutral_cooldown==0 && first_blood_neutral_queued==true
{
	var new_spawner;
	new_spawner=spawn_instrument_spawner(noone)

	var a;
	a=effect_aniend(first_blood_zap_neutral,0.2,-2)
	a.x=new_spawner.x
	a.y=new_spawner.y

	first_blood_status="timedout"
	peacetime=0
	first_blood_neutral_cooldown=350
	first_blood_neutral_queued=false
}

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////   trial modes score ticker
if kouchou.map=="firetrial" || kouchou.map=="icetrial"
{
	if instance_exists(player)
		scoer+=1
}


/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////   peacetime counter
if mode==0 &&  first_blood_status=="none" 
{
	peacetime+=1
	if peacetime>2000
	{
		//show_debug_message("peacetime limit, spawned instrument, diggable block ="+string(d))
		first_blood_activate_neutral()
	}
}



//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////   scrolling and terrain gen
var lowest;
lowest=0

for (var i=0; i<instance_number(player); i+=1)
{
	if instance_find(player,i).y>lowest
		lowest=instance_find(player,i).y
};
	
if lowest>player_baseline
	player_baseline=lowest
	
var player_baseline_difference
player_baseline_difference=player_baseline-player_baseline_prev


player_baseline_prev=player_baseline


if lowest>840 && !instance_exists(ice_block)   // [finaledit] don't like doing this iceblock check in step　(でもしょうがないね)
{	//////////////////////////////////////// CAMERA SCROLL
	var scrollspeed;
	scrollspeed=4
	with scrolls     ///scroll objects down with the 'view'
	{
		y-=scrollspeed
	} 
	with block       ///kill blocks outside the map
	{
		if y<-80
			instance_destroy()        
	}
	with player      ///kill players above the top boundary
	{
		if dash_rocket_top_collision_safety>0
		{
			if !place_meeting(x,y+scrollspeed,block)
				y+=scrollspeed
		}

		if y<-10
			playerdie()
	}
	with icespike
	{
		if y<0
			icicle_fall_code(0)
		if falling && y<40
			y+=scrollspeed   //negates scroll up if falling, hopefully keeping icicles at top of screen
	}
	
	will_update_blocks_to_draw_list=true	
	travelled+=scrollspeed             ///add to travelled, total distance scrolled downward
	player_baseline-=scrollspeed	
	player_baseline_prev-=scrollspeed   ///player_baseline_difference should be relative
	//total_baseline_movement-=scrollspeed


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
		if travelled>mountainlevel && !instance_exists(mountains_backdrop) 
		{
			instance_create(kouchou.room_left_border_x,room_height,mountains_backdrop)
		} 

		travelled_tick_biome_threshold_check()
	}
	
    
	bloodmoon_recalc_call=true
}



bedrockcounter+=player_baseline_difference        ///add to bedrockcounter, ticker for creating new blocks
total_baseline_movement+=player_baseline_difference
//if player_baseline_difference!=0
//	show_debug_message("baseline difference is:"+string(player_baseline_difference)+", bedrockcounter is now:"+string(bedrockcounter)+" baseline is now:"+string(player_baseline))
	
surface_redraw_counter+=player_baseline_difference
if surface_redraw_counter>SURFACE_REDRAW_INTERVAL
{
	fossil_surface_redraw_needed=true
	surface_redraw_counter-=SURFACE_REDRAW_INTERVAL
}

terrain_generate(player_baseline+CREATIONDELAY-bedrockcounter)


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
for (var i=0; i<kouchou.players_in; i+=1)   ////[finaledit] using players_in might cause slot problems
{
	gamepad=ds_map_find_value(kouchou.keybinding_map_array[i],"gamepad")    ///sets gamepad and padnumber variables for input scripts. [finaledit] should have a better system.
	if gamepad
		padnumber=ds_map_find_value(kouchou.keybinding_map_array[i],"padnumber")
		
		
	/////////////////////////////////////////////////////////////////////////////////////////////////////PAUSE SCREEN REQUEST
	if checkkey_released(ds_map_find_value(kouchou.keybinding_map_array[i],"startbutton"))
	{
		if pausescreen_doubletap_counter<1
		{
			pausescreen_requester_id=i
			alarm[11]=2   ///delay
			pausescreen_doubletap_counter=20
		}
	}
};



