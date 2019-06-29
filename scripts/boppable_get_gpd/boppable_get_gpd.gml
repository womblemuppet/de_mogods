
if protection<1
{
	block_take_damage()
}

if instance_exists(other.creator)
{
	with other.creator
	{
		if !place_meeting(x,y-1,block)
			y-=1
		vspd=-3.5    ////bounce up
	}
}
