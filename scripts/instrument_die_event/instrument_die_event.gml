if !dontmakeorb
{
	var a;
	a=spawn_orb_type(x+20,y+25,type)
	
	if instance_exists(other)
	{
		if other.object_index==dashattack || (other.object_index==hitbox && other.attack_name=="ground pound")
			a.targ=other
	}
	
	effect_aniend(instrument_catch_fire,0.05,-2)
	with create_terrain_cutter(eightysqcircle,"ritual",90,2)
	{
		x+=20
		y+=20
	}
}

instance_destroy()

