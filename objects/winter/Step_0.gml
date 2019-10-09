if targeting
{
	for (var i = 0; i < instance_number(player);i++)
	{
		if instance_find(player,i).y>lowesty
			lowesty=instance_find(player,i).y
	}
}