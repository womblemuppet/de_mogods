//////////////////////////////////////////////////////
///            adds gravity to player      		////
//////////////////////////////////////////////////////

if float_counter>0
	exit

if groundcheck!=noone
	exit

if cangroundpound!=1 && dash_rocket_jump!=2 && airgrab_mode!="is_grabbing" && airgrab_mode!="being_airgrabbed" 
{  
	if vspd<0
		vspd+=GRAVITY/water_gravity_factor
	else
	{
		if vspd<VSPEED_FROM_GRAVITY_DOWN_MAX
			vspd+=GRAVITY_DOWN/water_gravity_factor
	}
}