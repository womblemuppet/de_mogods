if other.attack_name=="forwardpunch"
{    
	bigexplosion=true
	triggered=true
	bigexplosion_xscale=other.image_xscale
	if other.direction==180
		right=false
	else
		right=true
	
	if life==5
		life=10.1  ///.1 stops addition occuring again
}

