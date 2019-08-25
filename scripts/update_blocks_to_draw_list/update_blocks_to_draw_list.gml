/*
  also aizen.to_draw is used as a list of all blocks on screen.
*/

ds_list_clear(to_draw)


/*
for (var i = 0; i < instance_number(block); i++)
{
	var b;
	b=instance_find(block,i)
	if b.y<kouchou.rh+150 ///150 is buffer
		ds_list_add(to_draw,b)
}
*/

with block
{
	if y<kouchou.rh+aizen.bh*3 ///added bh*4 is buffer
		ds_list_add(aizen.to_draw,id)	
}

to_draw_size=ds_list_size(to_draw)