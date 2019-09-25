if aizen.debug_show_hitboxes
	draw_sprite_ext(mask_index,image_index,x,y,image_xscale,image_yscale,image_alpha,image_blend,image_alpha)
else
	draw_self()