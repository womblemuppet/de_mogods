if immune                          /////////////damage flicker
{
	if image_alpha==round(image_alpha)
	{
		if image_alpha==1
			image_alpha=0.1
		if image_alpha==0
			image_alpha=0.8
	}
	else
	{
		if image_alpha==0.1
			image_alpha=0
		if image_alpha==0.8
			image_alpha=1
	}
    
	var bl;
	bl=c_green
	if H==2
		bl=c_yellow
	if H==1
		bl=c_red
        
	draw_sprite_ext(sprite_index,image_index,x,y-8,image_xscale,image_yscale,image_angle,bl,image_alpha)   
}
else
	draw_sprite_ext(sprite_index,image_index,x,y-8,image_xscale,image_yscale,image_angle,image_blend,image_alpha)

if hothands!=0
	draw_sprite_ext(hhspr,hothandimageindex,x,y-38,scale,scale,0,aizen.hothandspaydaycolour,1)

if aizen.debug_show_hitboxes
	draw_sprite_ext(mask_index,0,x,y,image_xscale,image_yscale,image_angle,image_blend,image_alpha)

