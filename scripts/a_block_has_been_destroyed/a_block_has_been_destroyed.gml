// called once per step max, will be called if a block was destroyed last step.

will_update_blocks_to_draw_list=true


//Resprite all blocks close to any destroyed block
var xx,yy;
for (var i=0; i < ds_list_size(destroy_proximity_coods_x); i++)
{
	xx=destroy_proximity_coods_x[| i]
	yy=destroy_proximity_coods_y[| i]	
	
	for  (ii = 0; ii < aizen.to_draw_size; ii++)
	{
		with aizen.blocks_to_draw[| ii]
		{
			if distance_to_point(xx,yy)<160
				ds_list_add(aizen.blockstosprite,self.id)
		}
	}
}

//delete props if the block they are connected to no longer exists
with prop
{
	var existing_connectors;
	existing_connectors=0
	
	for (var i = 0; i < NOconnectors; i++)
	{
		if connectors[i]!=undefined && instance_exists(connectors[i])
			existing_connectors++
	}
	
	if existing_connectors<1
	{
		show_debug_message("prop "+name+"destroyed,no connectors")
		instance_destroy()
	}
}

with prop_flag_left_pole
{
	if !instance_exists(flag_end_point)
		instance_destroy()
}
with prop_flag_piece //[finaledit] this is backwards, pole should have list of pieces not vv
{
	if !instance_exists(left_flag) || !instance_exists(right_flag)
		instance_destroy()
}

ds_list_clear(destroy_proximity_coods_x)
ds_list_clear(destroy_proximity_coods_y)
