time_alive++

if time_alive>LAVA_SHOW_BREWING_THRESHOLD && my_lava==noone
{
	if lava_brewing_effect_timer==0
	{
		lava_brewing_effect_timer=20
		spawn_lava_brewing_effects()
	}
	else
		lava_brewing_effect_timer--
	
	if aizen.timeSinceLastScrolled>100 && time_alive>LAVA_THRESHOLD
	{
		if my_lava==noone
		{
			my_lava=instance_create_depth(0,room_height,-4,lava_level)
			spawn_lava_brewing_effects()
		}
	}
}


