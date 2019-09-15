var possibles=ds_list_create()

var numberofblocks_horizontal
numberofblocks_horizontal=kouchou.rw/aizen.bw
			
for (var i = 0; i < numberofblocks_horizontal; i++) 
{
	if terrain_buffer_layer_newest[i]>0 && terrain_buffer_layer2[i]==-1
		ds_list_add(possibles,terrain_buffer_layer_newest[i])
}
			
if ds_list_size(possibles)>0
{
	ds_list_shuffle(possibles)
	var critter_spawn_x;
	critter_spawn_x=possibles[| 0].x
	show_debug_message("spawned, crittter_spawn_x = "+string(critter_spawn_x)+" terrain_buffer_layer_newest["+string(0)+"] = "+string(terrain_buffer_layer_newest[0])+" terrain_buffer_layer2["+string(0)+"] = "+string(terrain_buffer_layer2[0]))
	var a;
	a=instance_create(critter_spawn_x,argument0-aizen.bh,crab)
	with a
		critter_throwable_setup(choose("crab","goat"))
}
ds_list_destroy(possibles)