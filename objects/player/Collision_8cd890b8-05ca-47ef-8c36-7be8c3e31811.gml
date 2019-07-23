if other.ready==true 
{
	losehp(false,"icespike")
	var xx,yy;
	xx=x
	yy=y
	with icespike
	{
		if distance_to_point(xx,yy)<80
		{
			effect_create_above(ef_firework,x,y,1,c_white)  //[finaledit]
			instance_destroy()
		}
	}
	
	cc_hit_by_orb_effect_event(P)
}

