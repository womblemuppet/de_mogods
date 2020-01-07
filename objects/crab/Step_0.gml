/////apply gravity
if owner==-1 
{
		if y<aizen.player_baseline+aizen.CREATIONDELAY-aizen.bh
			grav(8)
        //[finaledit]  shouldn't be happening in the first place
		if y<-30 || y>3000
		{
			show_debug_message("crab blerped off top/bottom of room, y="+string(y))
			instance_destroy()
		}


}
else ///attach to owner
{
	if instance_exists(owner)   //[finaledit] optimize
	{
		x=owner.x
		y=owner.y-15
	}
}



/// apply horizontal movement if in moving state
if !breaking
{
	if right
	{
		repeat(spd)
		{
			if !place_meeting(x+1,y,block) && x<kouchou.room_right_border_x+room_boundary_no_go_distance
				x+=1
			else
			{
				sprite_index=stand_sprite
				break;
			}
		}
	}
	else
	{
		repeat(spd)
		{
			if !place_meeting(x-1,y,block) && x>kouchou.room_left_border_x-room_boundary_no_go_distance
				x-=1
			else
			{
				sprite_index=stand_sprite
				break;
			}
		}
	}
}

