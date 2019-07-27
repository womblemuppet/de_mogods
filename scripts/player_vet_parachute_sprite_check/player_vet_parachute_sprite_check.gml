if uniques_parachute==1     ////parachute floating effect
{
	if vspd>UNIQUES_PARACHUTE_FALL_SPEED
		vspd=UNIQUES_PARACHUTE_FALL_SPEED
	if sprite_index==sprites[4]  ///fall sprite
		sprite_index=sprites[64] ///parachute sprite
	if sprite_index==sprites[12] ///fall super sprite
		sprite_index=sprites[65] ///parachute super sprite
	if !checkkey(upbutton)        ////release parachute
	{
		uniques_parachute=2
		if sprite_index==sprites[64] || sprite_index==sprites[65]
		{
			sprite_index=sprites[4]  //fall sprite
			if super_mode
				sprite_index=sprites[12] //fall super sprite       
		}        
	}
}
