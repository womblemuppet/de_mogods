if targeting
{
	for (var i = 0; i < instance_number(player);i++)
	{
		if instance_find(player,i).y>lowesty
			lowesty=instance_find(player,i).y
	}
	
	
	
	var closest_distance_to_edge;
	closest_distance_to_edge=9999

	for (var i = 0; i < instance_number(player);i++)
	{
		var newside;
		var xx=instance_find(player,i).x
	
		if xx>kouchou.room_x_halfway
			newside="right"
		else
			newside="left"
		
		var dist;
		if newside=="right"
			dist=kouchou.room_right_border_x-xx
		else
			dist=xx-kouchou.room_left_border_x
		
		if dist<closest_distance_to_edge
		{
			closest_distance_to_edge=dist
			side=newside
		}
	}

	if sky.snow_effect_disable_side_change_counter<1
	{
		if side=="right"
		{
			if sky.snow_previous_side!="right"
				sky.snow_effect_disable_side_change_counter=20
			sky.snow_hspd=-sky.SNOW_WINDY_HSPD
			sky.snow_previous_side=side
		}
		else
		{
			if sky.snow_previous_side!="left"
				sky.snow_effect_disable_side_change_counter=20
			sky.snow_hspd=sky.SNOW_WINDY_HSPD
			sky.snow_previous_side=side
		}
	}
}