//it is possible for spawn_prop to terminate early without creating a prop instance


var p_sprite,p_sprite_die;


var xx,yy,block_column_number,prop_list;
yy=argument0
block_column_number=argument1
prop_list=argument2
xx=kouchou.room_left_border_x+block_column_number*aizen.bw


var new_prop_properties;
new_prop_properties=decide_prop_properties(biome,prop_list)


//flags setup
if new_prop_properties.p_name=="flag"
{
	//connect to random block
	var allblocks,chosen_block;
	allblocks=ds_list_create()
	

	//for (var i = 0; i < array_length_1d(block_history_newest);i++)
	//{
	//	if block_history_newest[i]>0
	//		ds_list_add(allblocks,block_history_newest[i])
	//}
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

	if ds_list_empty(allblocks)
		exit
	
	//filter blocks too close
	for (var i = ds_list_size(allblocks)-1; i >0 ; i--) 
	{
		var blockx,blocky;
		blockx=allblocks[| i].x
		blocky=allblocks[| i].y
		
		if point_distance(xx,yy,blockx,blocky) < 300
			ds_list_delete(allblocks,i)
		else
			show_debug_message("id:" +string(allblocks[| i].id) + "  y="+string(allblocks[| i].y))
	}
	
	if ds_list_empty(allblocks)
		exit
		
	ds_list_shuffle(allblocks)
	chosen_block=allblocks[| 0]

	ds_list_destroy(allblocks)

	//find coordinates of start and end flag, with start flag being on the left
	var x1,y1,x2,y2;
	if chosen_block.x>=xx
	{
		x1=xx
		y1=yy
		x2=chosen_block.x
		y2=chosen_block.y
	}
	else
	{
		x1=chosen_block.x
		y1=chosen_block.y
		x2=xx
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

prop_create(xx,yy,p_sprite,p_sprite_die,p_name,p_cutTerrain,p_NOconnectors)

with new_prop_properties
	instance_destroy()