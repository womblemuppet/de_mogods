if !dontmakeorb
{
	spawn_orb_type(x+20,y+25,type)
	effect_aniend(instrument_catch_fire,0.05,-2)
	with create_terrain_cutter(eightysqcircle,"ritual",90,2)
	{
		x+=20
		y+=20
	}
}

//effect_create_above(ef_firework,x,y,1,c_maroon) [finaledit] make sure there's an effect


