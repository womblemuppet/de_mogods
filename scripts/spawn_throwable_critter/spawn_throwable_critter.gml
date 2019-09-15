var y_position;
y_position=argument0

var possibles;
possibles=argument1

var numberofblocks_horizontal
numberofblocks_horizontal=kouchou.rw/aizen.bw

var critter_spawn_x;
critter_spawn_x=possibles[| 0].x
//show_debug_message("spawned, crittter_spawn_x = "+string(critter_spawn_x)+" terrain_buffer_layer_newest["+string(0)+"] = "+string(terrain_buffer_layer_newest[0])+" terrain_buffer_layer2["+string(0)+"] = "+string(terrain_buffer_layer2[0]))

var a;
a=instance_create(critter_spawn_x,y_position-aizen.bh,crab)
with a
	critter_throwable_setup(choose("crab","goat"))
