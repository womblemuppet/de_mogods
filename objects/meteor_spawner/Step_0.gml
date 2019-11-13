if wave_timer>0
	wave_timer--
else if meteor_timer>0
	meteor_timer--
else
{
	if meteor_number==4  //reset
	{
		meteor_number=0
		wave_timer=TIME_BETWEEN_WAVES	
		if low_side=="right"
			low_side="left"
		else
			low_side="right"
	}
	else if meteor_number==0  //setup
		meteor_number=1

	
	meteor_timer=TIME_BETWEEN_METEORS
	meteor_number++
	var xx;
	switch meteor_number
	{
		case 1: xx=kouchou.room_left_border_x+125		break;
		case 2: xx=kouchou.room_left_border_x+325		break;
		case 3: xx=kouchou.room_right_border_x-325		break;
		case 4: xx=kouchou.room_right_border_x-125		break;
	}
	
	instance_create_depth(xx,0,0,meteor)


}