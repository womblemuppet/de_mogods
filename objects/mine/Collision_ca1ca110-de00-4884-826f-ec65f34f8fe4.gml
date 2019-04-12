if other.attackname=="forwardpunch"
{    
	if creator==other.creator
	{
		hspd=3
		if other.direction==180
			hspd=-3
		vspd=-10
		if !place_meeting(x,y-1,block)
		        y-=1
	}
}

