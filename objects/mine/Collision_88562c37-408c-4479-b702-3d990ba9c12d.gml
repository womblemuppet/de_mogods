if other.attackname=="forwardpunch"
{    
	if creator==other.creator
	{
		vspd=-15
		if !place_meeting(x,y-1,block)
			y-=1
	}
}

