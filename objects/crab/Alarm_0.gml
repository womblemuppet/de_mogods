alarm[0]=STEPTIME

if owner!=noone
	exit

///toggle action being stopping or moving
breaking=!breaking

//if moving, turn direction if hitting a block
if !breaking
{
	var turning;
	turning=false
	
	instance_deactivate_object(self.id)
	//if sharing place with another crab
	if place_meeting(x,y,crab)
	{
		show_debug_message("crab-lision!!")

		var otherCrab = instance_position(x,y,crab);
		if otherCrab!=noone
			alarm[0]=10+irandom(STEPTIME*2)
	}
	instance_activate_object(self.id)
	
	if turning==false  //if not in collision with crab, turn when hitting a wall or edge of stage
	{
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
	}
	
	if turning
	{
		image_index=0
		sprite_index=turn_sprite
	}
}
else //if breaking, set to walk sprite
	sprite_index=stand_sprite
