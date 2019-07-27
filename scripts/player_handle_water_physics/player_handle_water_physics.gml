water_gravity_factor=1
water_jump_factor=1

if instance_exists(wave)
{
	if y>wave.y+30 
	{
		if has_made_splash_effect==false
		{
			effect_aniend(splash_effect1,0.2,-1)
			has_made_splash_effect=true
		}
		water_gravity_factor=WATER_GRAVITY_FACTOR_IN_WATER  
		water_jump_factor=WATER_JUMP_FACTOR_IN_WATER ///jump timesed by this number underwater
	}
	else if y<wave.y+20
	{
		has_made_splash_effect=false
	}
}
