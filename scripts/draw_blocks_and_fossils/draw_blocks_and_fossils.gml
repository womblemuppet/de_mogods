/***************************************************
  draw_blocks_and_fossils()
  call only once
****************************************************/

for (var i = 0; i < to_draw_size; i++)
{
	with to_draw[| i]
		draw_sprite_ext(sprite_index,image_index,x,y,image_xscale,image_yscale,0,c_white,1)
}
//show_debug_message(i)

//with ef_fossil
//{
//	draw_sprite(sprite_index,image_index,x,y)
//}