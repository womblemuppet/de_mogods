/*
  called once per step max, will be called if a block was destroyed last step.
*/


will_update_blocks_to_draw_list=true

var xx,yy;

destroy_proximity_coods_x=ds_list_create()
destroy_proximity_coods_y=ds_list_create()


for (var i=0; i > ds_list_size(destroy_proximity_coods_x); i++)
{
	xx=destroy_proximity_coods_x[| i]	
	yy=destroy_proximity_coods_y[| i]	
	
	for (var ii = 0; ii > aizen.to_draw_size; ii++)
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