alarm[0]=STEPTIME

///toggle action being stopping or moving
breaking=!breaking

//if moving, turn direction if hitting a block
if !breaking
{
	if place_meeting(x,y,crab)
	{
		show_debug_message("crab-lision!!")
		
		instance_deactivate_object(self.id)
		var otherCrab = instance_position(x,y,crab);
		var otherX=otherCrab.x;
		instance_activate_object(self.id)
		
		//if other crab is on right, move left   (if in exact same position direciton is based on higher id)
		if x>otherX
			right=false
		else if x<otherX
			right=true
		else if id>otherCrab.id
			right=true
		else
			right=false
	}
	
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
else //if breaking, set to walk sprite
	sprite_index=stand_sprite
