var check_blocks_this_step;
check_blocks_this_step=true

//if horizontal_delta_counter>10 
//{
//	horizontal_delta_counter-=10
//	check_blocks_this_step=true
//}
//else if horizontal_delta_counter<-10
//{
//	horizontal_delta_counter+=10
//	check_blocks_this_step=true
//}


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
		
		if height_delta_counter>20                    //////////destroy blocks above effect line every 10 moves
		{
			height_delta_counter-=20
			//check_blocks_this_step=true
		}

		//if check_blocks_this_step==true
		//{
			ds_list_clear(make_effect_blocks)
			
			var make_effect_blocks_ref;
			make_effect_blocks_ref=make_effect_blocks
		
		
			with block
			{
				if y < effect_line_yy+100 && x>xmin-37 && x<xmax+38
					ds_list_add(make_effect_blocks_ref,self.id)
					
				if y<effect_line_yy && x>xmin && x<xmax
					block_take_damage()
			}
		//}
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

if block_syphon_effects_counter==BLOCK_SYPHON_EFFECTS_COUNTER_MAX || block_syphon_effects_counter==ceil(BLOCK_SYPHON_EFFECTS_COUNTER_MAX/4)  || block_syphon_effects_counter==2*ceil(BLOCK_SYPHON_EFFECTS_COUNTER_MAX/4)  || block_syphon_effects_counter==3*ceil(BLOCK_SYPHON_EFFECTS_COUNTER_MAX/4)
{
	var a;    ///left
	a=effect_aniend(tornado_wind_sides_spr,0.2,-2)
	a.x=xmin
	a.y=effect_line_y
	
	var a;    ///right
	a=effect_aniend(tornado_wind_sides_spr,0.2,-2)
	a.x=xmax
	a.image_xscale=-1
	a.y=effect_line_y
}

block_syphon_effects_counter++
if block_syphon_effects_counter>BLOCK_SYPHON_EFFECTS_COUNTER_MAX
{
	block_syphon_effects_counter=0
	for (var i = 0; i < ds_list_size(make_effect_blocks);i++)
	{
		if !instance_exists(make_effect_blocks[| i])
			continue;

		var a;
		a=effect_aniend(tornado_syphon_block_effect_spr,0.2,-1)
		a.x=make_effect_blocks[| i].x
		a.y=make_effect_blocks[| i].y
		a.image_index=irandom(5)
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
	{
		x+=hspd
		horizontal_delta_counter+=hspd
	}
}
else //if hspd<0 will always be moving horizontally
{
	if x-hspd-WIDTH/2>kouchou.room_left_border_x
	{
		x+=hspd
		horizontal_delta_counter+=hspd
	}
}

