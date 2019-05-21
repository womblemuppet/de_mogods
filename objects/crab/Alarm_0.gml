alarm[0]=STEPTIME

breaking=!breaking

if !breaking
{
	if right==true
	{
		if place_meeting(x+1,y,block) || x>=kouchou.room_left_border_x-room_boundary_no_go_distance
			right=false
	}
	else
	{
		if place_meeting(x-1,y,block) || x<=kouchou.room_right_border_x+room_boundary_no_go_distance
			right=true
	}
}


