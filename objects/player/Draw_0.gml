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

var hhspr;
	hhspr=mask_player
	
	
if H>3
{
	if hothands==1
		hhspr=hh_stack_purple1
	else if hothands==2
		hhspr=hh_stack_purple2
	else if hothands==3
		hhspr=hh_stack_purple3
}
else if H==3
{
	if hothands==1
		hhspr=hh_stack_blue1
	else if hothands==2
		hhspr=hh_stack_blue2
	else if hothands==3
		hhspr=hh_stack_blue3
}
else if H==2
{
	if hothands==1
		hhspr=hh_stack_yellow1
	else if hothands==2
		hhspr=hh_stack_yellow2
	else if hothands==3
		hhspr=hh_stack_yellow3
}
else if H==1
{
	if hothands==1
		hhspr=hh_stack_red1
	else if hothands==2
		hhspr=hh_stack_red2
	else if hothands==3
		hhspr=hh_stack_red3
}

if hothands!=0
	draw_sprite_ext(hhspr,hothandimageindex,x,y-22,1,1,0,aizen.hothandspaydaycolour,1)

if aizen.debug_show_hitboxes
	draw_sprite_ext(mask_index,0,x,y,image_xscale,image_yscale,image_angle,image_blend,image_alpha)

