if recoil_sprite_counter>0      /// RECOILING
{
	sprite_index=sprites[25]  //recoiling
	if super_mode
		sprite_index=sprites[26]  //recoiling super
	exit
}
if !place_meeting(x,y+1,block)    /// IN AIR
{
	if vspd>FALLING_SPRITE_THRESHOLD_VSPD_LARGER_THAN
	{
		sprite_index=sprites[4]   //falldown sprite
		if super_mode
			sprite_index=sprites[12]
		image_speed=FRAME_SPEED_NORMAL
	}
	else
	{
		sprite_index=sprites[3]    //  air sprite
		if super_mode
			sprite_index=sprites[11]
	}
}
else                             /// ON GROUND
{
	sprite_index=sprites[0]  ///idle
	if super_mode
		sprite_index=sprites[9]
}
