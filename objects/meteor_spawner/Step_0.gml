if wave_timer>0
	wave_timer--
else if meteor_timer>0
	meteor_timer--
else
{
	meteor_timer=TIME_BETWEEN_METEORS
	meteor_number++
	

	var xx,small_offset,large_offset;
	small_offset=160
	large_offset=360
	
	if low_side=="left"
	{
		switch meteor_number
		{
			case 1: xx=kouchou.room_left_border_x+small_offset  break;
			case 2: xx=kouchou.room_right_border_x-large_offset break;
			case 3: xx=kouchou.room_left_border_x+large_offset  break;
			case 4: xx=kouchou.room_right_border_x-small_offset break;
		}
	}
	else
	{
		switch meteor_number
		{
			case 1: xx=kouchou.room_right_border_x-small_offset break;
			case 2: xx=kouchou.room_left_border_x+large_offset  break;
			case 3: xx=kouchou.room_right_border_x-large_offset break;
			case 4: xx=kouchou.room_left_border_x+small_offset  break;
		}
	}
	
	instance_create_depth(xx,0,0,meteor)

	if meteor_number==4  //reset
	{
		meteor_number=0
		wave_timer=TIME_BETWEEN_WAVES	
		if low_side=="right"
			low_side="left"
		else
			low_side="right"
	}
}