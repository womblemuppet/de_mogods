image_index=0
if groundcheck==noone
{
	sprite_index=sprites[? "recoiling"]  //recoiling
	if super_mode
		sprite_index=sprites[? "recoiling_u"]  //recoiling super
}
else
{
	if vspd>FALLING_SPRITE_THRESHOLD_VSPD_LARGER_THAN
		sprite_index=sprites[? "recoiling_fall"]
	else
		sprite_index=sprites[? "recoiling_air"]

}