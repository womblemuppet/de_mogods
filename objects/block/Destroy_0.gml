var xx,yy;
xx=x
yy=y
with block
{
	if distance_to_point(xx,yy)<65
	{
		ds_list_add(aizen.blockstosprite,self.id)
	}
}

with aizen
	will_update_blocks_to_draw_list=true
