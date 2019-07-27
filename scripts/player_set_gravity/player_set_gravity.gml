if groundcheck==noone && cangroundpound!=1 && dash_rocket_jump!=2 && airgrab_mode!=2 && airgrab_mode!=4      /// player gravity
{  
	if vspd<0
		vspd+=GRAVITY/water_gravity_factor
	else
	{
		if vspd<VSPEED_FROM_GRAVITY_DOWN_MAX
			vspd+=GRAVITY_DOWN/water_gravity_factor
	}
}