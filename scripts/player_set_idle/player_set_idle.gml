if recoil_sprite_counter>0      /// RECOILING
{
	sprite_index=sprites[? "recoiling"]  //recoiling
	if super_mode
		sprite_index=sprites[? "recoiling_u"]  //recoiling super
	exit
}
if !place_meeting(x,y+1,block)    /// IN AIR
{
	if vspd>FALLING_SPRITE_THRESHOLD_VSPD_LARGER_THAN
	{
		sprite_index=sprites[? "fall"]   //falldown sprite
		if super_mode
			sprite_index=sprites[? "fall_u"]
		image_speed=FRAME_SPEED_NORMAL
	}
	else
	{
		sprite_index=sprites[? "air"]    //  air sprite
		if super_mode
			sprite_index=sprites[? "air_u"]
	}
}
else                             /// ON GROUND
{
	sprite_index=sprites[? "idle"]
	if super_mode
		sprite_index=sprites[? "idle_u"]
}
