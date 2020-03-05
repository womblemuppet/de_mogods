/***************************************************
  terrain_generate(y position)
  the terrain type and block creation part of terrain gen
  doesn't include biome selection or backdrops.
  not connected to "travelled" variable
  called from aizen
  
 ***************************************************/
if scrolled_amount>=aizen.bh    ///create new blocks every x pixels moved down ( x = block height )
{
	var y_position;
	y_position=argument0

	//show_debug_message("GENERATED--------------------")
	//show_debug_message("scrolled_amount="+string(scrolled_amount));
	//show_debug_message("y_position="+string(y_position));
	//show_debug_message("absolute_y_position = "+ string(y_position+travelled));

	debug_amount_scrolled_since_last_tergen=0


	var numberofblocks_horizontal;
	numberofblocks_horizontal=kouchou.rw/aizen.bw

	scrolled_amount-=aizen.bh    ///reset scrolled_amount

	for (var i = 0; i < ds_list_size(blockstosprite_prevlayer); i++) 
	{
		ds_list_add(blockstosprite,blockstosprite_prevlayer[| i])
	}
	ds_list_clear(blockstosprite_prevlayer)

	number_of_tergenned_lines++

		
	///update block history
	for (var i = 0; i < numberofblocks_horizontal; i++) 
	{
		block_history_layer_3[i]=block_history_layer_2[i]
		block_history_layer_2[i]=block_history_newest[i]
	}
	
	//show_debug_message("terrain gen at "+string(player_baseline+CREATIONDELAY)+"baseline:"+string(player_baseline)+"   "+string(scrolled_amount)+" is scrolled_amount")

	terrain_ammo-=1  //move one layer on in current terrain chunk
	//show_message(terraintype+"    ammo="+string(terrain_ammo))
	if terrain_ammo<1   /// new terrain type
		set_new_chunk()

	///biomeswitch event will overwrite all of the above switch 
	if biomeswitch   ///[finaledit] check if used...
	{
		terraintype="biomegap"
		terrain_ammo=4
		biomeswitch=false
		//call_block_setup()
	}

	///determine based on terraintype characteristics whether or not to spawn a block for each square left to right of the current layer
	spawn_line_of_blocks(y_position)
	
	
	
	//spawn critters/crabs
	
	var spawn_a_throwable_critter;
	spawn_a_throwable_critter=false
	
	var spawn_a_nonthrowable_critter;
	spawn_a_nonthrowable_critter=false

	if random(1)>0.4 
		spawn_a_throwable_critter=true

	if random(1)>0.3
		spawn_a_nonthrowable_critter=true
		
	if spawn_a_throwable_critter || spawn_a_nonthrowable_critter
	{
		blocks_with_space_above=ds_list_create()  //ids of blocks with spawn space available
	
		for (var i = 0; i < numberofblocks_horizontal; i++) 
		{
			if space_for_spawn_exists(i)
			 	ds_list_add(blocks_with_space_above,block_history_newest[i])
		}
	
		//show_debug_message("size of blocks_with_space_above"+string(ds_list_size(blocks_with_space_above)))
	
		if ds_list_size(blocks_with_space_above)>0
		{
			if spawn_a_throwable_critter
			{
				ds_list_shuffle(blocks_with_space_above)
				spawn_throwable_critter(y_position,blocks_with_space_above)
			}
			
			if spawn_a_nonthrowable_critter
			{
				ds_list_shuffle(blocks_with_space_above)
				spawn_nonthrowable_critter(y_position,blocks_with_space_above)
			}
		}
		
		ds_list_destroy(blocks_with_space_above)
	}
	

}
