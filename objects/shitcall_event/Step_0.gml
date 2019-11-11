if time_alive>LAVA_THRESHOLD
{
	my_lava=instance_create_depth(0,room_height,-4,lava_level)
}
else
	time_alive++
