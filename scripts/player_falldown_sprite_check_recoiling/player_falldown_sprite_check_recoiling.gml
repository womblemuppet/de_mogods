if vspd<=RECOILING_AIR_FLIP_SPRITE_THRESHOLD_VSPD_LARGER_THAN
	return false

if sprite_index==sprites[? "recoiling_air"]
{
	sprite_index=sprites[? "recoiling_air_flip"]
	image_index=0
}