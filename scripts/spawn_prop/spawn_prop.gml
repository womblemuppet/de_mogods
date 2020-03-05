//it is possible for spawn_prop to terminate early without creating a prop instance


var p_sprite,p_sprite_die;


var yy,block_column_number,prop_list;
yy=argument0
block_column_number=argument1
prop_list=argument2


var new_prop_properties;
new_prop_properties=decide_prop_properties(biome,prop_list)

if new_prop_properties.p_name=="flag"
{
	//connect to random block
	var allblocks,chosen_block;
	allblocks=ds_list_create()
	

	for (var i = 0; i < array_length_1d(block_history_newest);i++)
	{
		if block_history_newest[i]>0
			ds_list_add(allblocks,block_history_newest[i])
	}
	for (var i = 0; i < array_length_1d(block_history_layer_2);i++)
	{
		if block_history_layer_2[i]>0
			ds_list_add(allblocks,block_history_layer_2[i])
	}
	for (var i = 0; i < array_length_1d(block_history_layer_3);i++)
	{
		if block_history_layer_3[i]>0
			ds_list_add(allblocks,block_history_layer_3[i])
	}
	
	ds_list_shuffle(allblocks)

	if ds_list_empty(allblocks)
		exit
		
	chosen_block=allblocks[| 0]

	ds_list_destroy(allblocks)

	var x1,y1,x2,y2;
	if chosen_block.x>=kouchou.room_left_border_x+block_column_number*aizen.bw
	{
		x1=kouchou.room_left_border_x+block_column_number*aizen.bw
		y1=yy
		x2=chosen_block.x
		y2=chosen_block.y
	}
	else
	{
		x1=chosen_block.x
		y1=chosen_block.y
		x2=kouchou.room_left_border_x+block_column_number*aizen.bw
		y2=yy
	}
	

	

	prop_flag_create(x1,y1,x2,y2)

	with new_prop_properties
		instance_destroy()
		
	exit
}

var p_sprite,p_sprite_die,p_name,p_cutTerrain,p_NOconnectors;
p_sprite=new_prop_properties.p_sprite
p_sprite_die=new_prop_properties.p_sprite_die
p_name=new_prop_properties.p_name
p_cutTerrain=new_prop_properties.p_cutTerrain
p_NOconnectors=new_prop_properties.p_NOconnectors

prop_create(kouchou.room_left_border_x+block_column_number*aizen.bw,yy,p_sprite,p_sprite_die,p_name,p_cutTerrain,p_NOconnectors)

with new_prop_properties
	instance_destroy()