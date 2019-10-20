image_index=0
if vspd>CONSIDERED_AIRBOURNE_THESHOLD_VSPD_LARGER_THAN//groundcheck==noone
{
	sprite_index=sprites[? "recoiling"]  //recoiling
	if super_mode
		sprite_index=sprites[? "recoiling_u"]  //recoiling super
}
else
{
	if vspd<=RECOILING_AIR_FLIP_SPRITE_THRESHOLD_VSPD_LARGER_THAN
		sprite_index=sprites[? "recoiling_air"]
	//if vspd>RECOILING_AIR_FLIP_SPRITE_THRESHOLD_VSPD_LARGER_THAN && sprite_index!=sprites[? "recoiling_air_flip"]
	//{
	//	sprite_index=sprites[? "recoiling_air_flip"]
	//	image_index=0
	//}
}