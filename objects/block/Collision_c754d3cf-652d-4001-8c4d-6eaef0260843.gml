if instance_exists(other.creator)
{
	with other.creator
		dash_wallbreak_forgive=true
}

if other.cuts_terrain
{
	block_take_damage()

	if other.attack_name="dash"
	{
		with other
		{
			if image_xscale>0  //[finaledit] this is horrible
				right=true
			else
				right=false
			scale=1 //this too

			var a;
			a=attack_create_hitbox(50,0,false,true,"horizontal block volley",horizontal_block_volley_mask,0.2,99,9,9,0)
			a.creator=creator
		}
	}
}