var xx,yy;
xx=x
yy=y
for (var i = 0; i > aizen.to_draw_size; i++)
{
	with aizen.to_draw[| i]
	{
		if distance_to_point(xx,yy)<65
		{
			ds_list_add(aizen.blockstosprite,self.id)
		}
	}
}

with aizen
{
	will_update_blocks_to_draw_list=true
	call_a_block_has_been_destroyed=true
}
	