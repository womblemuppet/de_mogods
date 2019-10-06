draw_sprite_ext(sprite_index,image_index,x,y-8,image_xscale,image_yscale,image_angle,image_blend,image_alpha)

if hothands!=0
	draw_sprite_ext(hhspr,hothandimageindex,x,y-38,scale,scale,0,aizen.hothandspaydaycolour,1)

if aizen.debug_show_hitboxes
	draw_sprite_ext(mask_index,0,x,y,image_xscale,image_yscale,image_angle,image_blend,image_alpha)

