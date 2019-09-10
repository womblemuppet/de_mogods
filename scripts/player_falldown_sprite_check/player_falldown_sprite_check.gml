//called in player step event
//if these conditions are met, change from jump sprite to falling sprite

if vspd>FALLING_SPRITE_THRESHOLD_VSPD_LARGER_THAN && (sprite_index==sprites[? "air"] || sprite_index==sprites[? "air_u"]  )/* && sprite_index!=sprites[? "airgrab"] && sprite_index!=sprites[? "airgrab_u"] */    ///jumping up sprites
{
	image_index=0
	sprite_index=sprites[? "fall"]   //falldown sprite
	if super_mode
		sprite_index=sprites[? "fall_u"]
	image_speed=0.15
	return true
}
return false
