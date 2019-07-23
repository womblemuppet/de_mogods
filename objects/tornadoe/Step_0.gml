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
		a.gravity*=0.1
		//a.vspeed=-2
		a.sprite_index=spiralpower_base_in_zone
	}
	
}

if active
{
	if height<MAX_GROWTH_DEPTH
	{
		height+=grow_rate
		height_delta_counter+=grow_rate
		effect_line_y=y-TOTAL_HEIGHT+height
		
		if height_delta_counter>20
		{
			height_delta_counter-=20
			var effect_line_yy,xmin,xmax
			xmin=x-WIDTH/2
			xmax=x+WIDTH/2
			effect_line_yy=effect_line_y
			with block
			{
				if y<effect_line_yy && x>xmin && x<xmax
					block_take_damage()
			}
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
	hspd-=0.2
if hspd<-min_speed
	hspd+=0.2
	
	
x+=hspd