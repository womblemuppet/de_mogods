/*
  called once per step max, will be called if a block was destroyed last step.
*/


will_update_blocks_to_draw_list=true

var xx,yy;

//show_debug_message(string(ds_list_size(destroy_proximity_coods_x))+" is length of dpcx")
for (var i=0; i < ds_list_size(destroy_proximity_coods_x); i++)
{
	xx=destroy_proximity_coods_x[| i]	
	yy=destroy_proximity_coods_y[| i]	
	
	for  (ii = 0; ii < aizen.to_draw_size; ii++)
	{
		with aizen.to_draw[| ii]
		{
			if distance_to_point(xx,yy)<65
			{
				ds_list_add(aizen.blockstosprite,self.id)
			}
		}
	}
	
	
}

ds_list_clear(destroy_proximity_coods_x)
ds_list_clear(destroy_proximity_coods_y)

with instrument_spawner
{
	if dont_trigger_reset==false && !instance_exists(targ)
	{
		instance_destroy()
	}
}