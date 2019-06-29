
if protection<1
{
	block_take_damage()
}

if instance_exists(other.creator)
{
	show_debug_message(string(other.creator)+" WAS BOUNCED")
	with other.creator
	{
		if !place_meeting(x,y-1,block)
			y-=1
		vspd=-3.5    ////bounce up
	}
}
else
{
	show_debug_message("didn't bounce, other.creator= "+string(other.creator))
}
