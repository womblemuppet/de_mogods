alarm[0]=STEPTIME

///toggle action being stopping or moving
breaking=!breaking

//if moving, turn direction if hitting a block
if !breaking
{
	var turning;
	turning=false
	if right==true
	{
		if place_meeting(x+1,y,block) || x>=kouchou.room_left_border_x-room_boundary_no_go_distance
		{
			turning=true
			right=false
		}
	}
	else
	{
		if place_meeting(x-1,y,block) || x<=kouchou.room_right_border_x+room_boundary_no_go_distance
		{
			turning=true
			right=true
		}
	}
	
	if turning
	{
		image_index=0
		sprite_index=turn_sprite
	}
}
else
	sprite_index=walk_sprite
