bloodmoon_recalc_call=false

if pausescreen_doubletap_counter>0
	pausescreen_doubletap_counter-=1

warning_subimage+=1
if warning_subimage>9
	warning_subimage=0


hudfloatingmasks_subimage+=0.2
if hudfloatingmasks_subimage>HUDFLOATINGMASKS_IMAGE_NUMBER
	hudfloatingmasks_subimage=0




stackframe_subimage+=0.2
if stackframe_subimage>stackframe_image_number
{
	stackframe_subimage=0    
}

fossil_surface_redraw_needed=false


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////   trial modes score ticker
if kouchou.map=="firetrial" || kouchou.map=="icetrial"
{
	if instance_exists(player)
		scoer+=1
}


/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////   peacetime
if mode==0
{
	peacetime+=1
}



//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////   scrolling and terrain gen
var lowest;
lowest=0

for (i=0; i<instance_number(player); i+=1)
{
	if instance_find(player,i).y>lowest
		lowest=instance_find(player,i).y
};
if lowest>840 && !instance_exists(ice_block)   // [finaledit] don't like doing this iceblock check in step　(でもしょうがないね)
{
	var scrollspeed;
	scrollspeed=4
	with scrolls     ///scroll objects down with the 'view'
	{
		y-=scrollspeed
		if object_index==player     ///if recently done or doing a rocket jump, prevent going off the top of the screen
		{
			if dash_angel_top_collision_safety>0
			{
				if !place_meeting(x,y+scrollspeed,block)
					y+=scrollspeed
			}
		} 
	} 
	with block       ///kill blocks outside the map
	{
		if y<-80
			instance_destroy()        
	}
	with player      ///kill players above the top boundary
	{
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
    
	bloodmoon_recalc_call=true
    
	bedrockcounter+=scrollspeed        ///add to bedrockcounter, ticker for creating new blocks
	surface_redraw_counter+=scrollspeed
	if surface_redraw_counter>SURFACE_REDRAW_EVERY
	{
		fossil_surface_redraw_needed=true
		surface_redraw_counter-=SURFACE_REDRAW_EVERY
	}
	will_update_blocks_to_draw_list=true
	
	
	travelled+=scrollspeed             ///add to travelled, total distance travelled downward
	



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
	
	
	terrain_generate(CREATIONDELAY)
}


/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////   set all sprites for necessary blocks
if !ds_list_empty(blockstosprite)
{
	for (i=0; i<ds_list_size(blockstosprite); i+=1)
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
    
	
	
	
	
	
if will_update_blocks_to_draw_list==true
{
	update_blocks_to_draw_list()
	will_update_blocks_to_draw_list=false
}
    
    
for (i=0; i<kouchou.playersin; i+=1)   ////[finaledit] using playersin might cause slot problems
{
	gamepad=ds_map_find_value(kouchou.keybinding_map_array[i],"gamepad")
	/////////////////////////////////////////////////////////////////////////////////////////////////////PAUSE SCREEN REQUEST
	if checkkey_released(ds_map_find_value(kouchou.keybinding_map_array[i],"startbutton"))
	{
		if pausescreen_doubletap_counter<1
		{
			pausescreen_requester=i
			alarm[11]=2   ///delay
			pausescreen_doubletap_counter=40
		}
	}
};



