var y_position;
y_position=argument0

var blocks_with_space_above;
blocks_with_space_above=argument1

var numberofblocks_horizontal
numberofblocks_horizontal=kouchou.rw/aizen.bw

if !instance_exists(blocks_with_space_above[| 0])
	return undefined;
var critter_spawn_x;
critter_spawn_x=blocks_with_space_above[| 0].x

//show_debug_message("spawned, crittter_spawn_x = "+string(critter_spawn_x)+" block_history_newest["+string(0)+"] = "+string(block_history_newest[0])+" block_history_layer_2["+string(0)+"] = "+string(block_history_layer_2[0]))

var a;                         /// 30 = 1/2 sprite width of crab
a=instance_create_depth(critter_spawn_x+30,y_position-aizen.bh+30,-3,crab)
with a
	critter_throwable_setup(choose("crab","goat"))
