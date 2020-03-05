var critter_type,critter_species;
critter_type=choose("ground")//,"flying"

var y_position;
y_position=argument0

var blocks_with_space_above;
blocks_with_space_above=argument1

if !instance_exists(blocks_with_space_above[| 0])
	return undefined;
var critter_spawn_x;	
critter_spawn_x=blocks_with_space_above[| 0].x

//show_debug_message("spawned, critter_spawn_x = "+string(critter_spawn_x)+" block_history_newest["+string(0)+"] = "+string(block_history_newest[0])+" block_history_layer_2["+string(0)+"] = "+string(block_history_layer_2[0]))

if critter_type=="ground"
	critter_species=choose("worm")//,snake etc)
	
var a;
a=instance_create_depth(critter_spawn_x,y_position-aizen.bh,-3,critter)
with a
	critter_nonthrowable_setup("worm")