var y_position;
y_position=argument0

var possibles;
possibles=argument1

var numberofblocks_horizontal
numberofblocks_horizontal=kouchou.rw/aizen.bw

if !instance_exists(possibles[| 0])
	return undefined;
var critter_spawn_x;
critter_spawn_x=possibles[| 0].x

//show_debug_message("spawned, crittter_spawn_x = "+string(critter_spawn_x)+" terrain_buffer_layer_newest["+string(0)+"] = "+string(terrain_buffer_layer_newest[0])+" terrain_buffer_layer2["+string(0)+"] = "+string(terrain_buffer_layer2[0]))

var a;                         /// 30 = 1/2 sprite width of crab
a=instance_create_depth(critter_spawn_x+30,y_position-aizen.bh+30,-3,crab)
with a
	critter_throwable_setup(choose("crab","goat"))
