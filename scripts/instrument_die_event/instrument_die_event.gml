if !dontmakeorb
{
	var a;
	a=spawn_orb_type(x+20,y+25,type)
	
	if instance_exists(other)   ///dash attack, or bop hitbox
	{
		show_debug_message("other's("+string(other)+" object name = "+string(object_get_name(other.object_index)))
		
		if other.object_index==dashattack
			a.targ=other.creator.id
		else if  other.object_index==bop_hitbox
			a.targ=other.creator.id
		else if other.object_index==hitbox
		{
			if other.attack_name=="rocket jump"
				a.targ=other.creator.id
		}
	}
	
	effect_aniend(instrument_catch_fire,0.05,-2)
	with create_terrain_cutter(eightysqcircle,"ritual",90,2)
	{
		x+=20
		y+=20
	}
}

instance_destroy()

