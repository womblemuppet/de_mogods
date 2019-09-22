if active
{
	var effect_line_yy,xmin,xmax
	effect_line_yy=effect_line_y   ////(reference when using with)
	xmin=x-WIDTH/2
	xmax=x+WIDTH/2
	
	if height<MAX_GROWTH_DEPTH
	{
		height+=grow_rate                                  ///// grow towards max height
		height_delta_counter+=grow_rate
		effect_line_y=y-TOTAL_HEIGHT+height
		
		if height_delta_counter>10                    //////////destroy blocks above effect line every 10 moves
		{
			height_delta_counter-=10
			
			ds_list_clear(make_effect_blocks)
			
			var make_effect_blocks_ref;
			make_effect_blocks_ref=make_effect_blocks;
			
			with block
			{
				if y<effect_line_yy-30 && x>xmin && x<max
					ds_list_add(make_effect_blocks_ref,self.id)
				if y<effect_line_yy && x>xmin && x<xmax
					block_take_damage()
			}
		}
	}

	
	with player /////////////if player in effect area above effect line, get sucked up ///[finaledit] can maybe optimise
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
			dash_rocket_top_collision_safety_on=false
		}
	}
}


/// friction
if hspd>min_speed
	hspd-=0.125
if hspd<-min_speed
	hspd+=0.125


/////// horizontal movement
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