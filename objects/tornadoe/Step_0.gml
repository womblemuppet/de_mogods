repeat(repeat_effects_factor)
{
	a=effect_aniend(spiralpower_base,0.8,-1)
	a.vspeed=-0.5
	a.gravity_direction=90
	a.gravity=0.01
	a.x+=8-random(16)
	var h;
	h=random(TOTAL_HEIGHT)-SPIRAL_EFFECT_HEIGHT  
	a.y-=h
	if a.y<effect_line_y+SPIRAL_EFFECT_HEIGHT/2
	{
		a.gravity*=2
		//a.vspeed=-2
		a.sprite_index=spiralpower_base_in_zone
	}
	else
		a.image_alpha=0.25
}

if active
{
	var effect_line_yy,xmin,xmax
	effect_line_yy=effect_line_y
	xmin=x-WIDTH/2
	xmax=x+WIDTH/2
	
	if height<MAX_GROWTH_DEPTH
	{
		height+=grow_rate
		height_delta_counter+=grow_rate
		effect_line_y=y-TOTAL_HEIGHT+height
		
		if height_delta_counter>20
		{
			height_delta_counter-=20
			with block
			{
				if y<effect_line_yy && x>xmin && x<xmax
					block_take_damage()
			}

		}
	}

	
	with player    ///[finaledit] can maybe optimise
	{
		if y<effect_line_yy && x>xmin && x<xmax && armouredframes<1
		{
			var a=effect_aniend(sprite_index,0.2,depth)
			a.vspeed=-50
			y=-100
			var offset;
			offset=P*2*aizen.bw
			if tornadoe.x>kouchou.room_x_halfway
				x=kouchou.room_left_border_x+offset
			else
				x=kouchou.room_right_border_x-offset
			dash_rocket_top_collision_safety=-1
		}
	}
		
	for (var i = 0; i < WIDTH/TUNNEL_EFFECT_WIDTH-1;i++) 
	{
		a=effect_aniend(tunnel_effect1,choose(0.3,0.4),-3)
		a.y-=TOTAL_HEIGHT-height
		a.x+=TUNNEL_EFFECT_WIDTH/2+(TUNNEL_EFFECT_WIDTH*i)-WIDTH/2
		a.x+=6-random(12)
		a.vspeed=-1.5
		a.gravity_direction=90
		a.gravity=0.15
	}
}

if hspd>min_speed
	hspd-=0.125
if hspd<-min_speed
	hspd+=0.125
	
if hspd>0
{
	if x+hspd+WIDTH/2<kouchou.room_right_border_x
		x+=hspd
}
else if hspd<0
{
	if x-hspd-WIDTH/2>kouchou.room_left_border_x
		x+=hspd
}