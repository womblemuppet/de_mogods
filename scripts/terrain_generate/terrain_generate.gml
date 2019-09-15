/***************************************************
  terrain_generate(y position)
  the terrain type and block creation part of terrain gen
  doesn't include biome selection or backdrops.
  not connected to "travelled" variable
  called from aizen
  
 ***************************************************/
if bedrockcounter>aizen.bh    ///create new blocks every x pixels moved down ( x = block height )
{
	var y_position;
	y_position=argument0

	var numberofblocks_horizontal
	numberofblocks_horizontal=kouchou.rw/aizen.bw

	bedrockcounter-=aizen.bh    ///reset bedrockcounter

	for (var i = 0; i < ds_list_size(blockstosprite_prevlayer); i++) 
	{
		ds_list_add(blockstosprite,blockstosprite_prevlayer[| i])
	}
	ds_list_clear(blockstosprite_prevlayer)

	number_of_tergenned_lines++

		
	///shift buffer
		
	for (var i = 0; i < numberofblocks_horizontal; i++) 
	{
		terrain_buffer_layer3[i]=terrain_buffer_layer2[i]
		terrain_buffer_layer2[i]=terrain_buffer_layer_newest[i]
	}
	
	//show_debug_message("terrain gen at "+string(player_baseline+CREATIONDELAY)+"baseline:"+string(player_baseline)+"   "+string(bedrockcounter)+" is bedrockcounter")

	terrainammo-=1  //move one layer on in current terrain chunk
	//show_message(terraintype+"    ammo="+string(terrainammo))
	if terrainammo<1   /// new terrain type
		set_new_chunk()

	/////////////////////////////////////////////////////////////////////////////////////////////biomeswitch event will overwrite all of the above switch 
	if biomeswitch   ///[finaledit] check if used...
	{
		terraintype="biomegap"
		terrainammo=4
		biomeswitch=false
		//call_block_setup()
	}

	//////determine based on terraintype characteristics whether or not to spawn a block for each square left to right of the current layer

	spawn_line_of_blocks(y_position)
	
	
	if terraintype!="startingflat"
	{
		if random(1)>0.995                                                          /////critter
		{
			spawn_critter(y_position)
		}
		
		if random(1)>0.75                                                          /////throwable critters
		{
			spawn_throwable_critter(y_position)
		}
	}
}
