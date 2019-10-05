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
		vspd+=GRAVITY
	else
	{
		if vspd<VSPD_FROM_GRAVITY_DOWN_MAX
			vspd+=GRAVITY_DOWN
	}
}