//called in player step event
//if these conditions are met, change from jump sprite to falling sprite

if vspd<=FALLING_SPRITE_THRESHOLD_VSPD_LARGER_THAN
	return false
	
if sprite_index==sprites[? "air"] || sprite_index==sprites[? "air_u"]
{
	image_index=0
	sprite_index=sprites[? "fall"]   //falldown sprite
	if super_mode
		sprite_index=sprites[? "fall_u"]
	return true
}
