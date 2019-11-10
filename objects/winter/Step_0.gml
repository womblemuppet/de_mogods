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

	///change snow effect direction
	if weather.snow_effect_disable_side_change_counter<1   ///restriction stops side flickering when on middle line of screen
	{
		if side=="right"
		{
			if weather.snow_previous_side!="right"
			{
				weather.snow_effect_disable_side_change_counter=20
				weather.snow_alpha=0
			}
			weather.snow_hspd=-weather.SNOW_WINDY_HSPD
			weather.snow_previous_side=side
		}
		else
		{
			if weather.snow_previous_side!="left"
			{
				weather.snow_effect_disable_side_change_counter=20
				weather.snow_alpha=0
			}
			weather.snow_hspd=weather.SNOW_WINDY_HSPD
			weather.snow_previous_side=side
		}
	}
}