//called in player step event
//if these conditions are met, change from jump sprite to falling sprite

if vspd>FALLING_SPRITE_THRESHOLD_VSPD_LARGER_THAN && (sprite_index==sprites[3] || sprite_index==sprites[11]  )/* && sprite_index!=sprites[23] && sprite_index!=sprites[24] */    ///jumping up sprites
{
	image_index=0
	sprite_index=sprites[4]   //falldown sprite
	if supers>0
		sprite_index=sprites[12]
	image_speed=0.15
	return true
}
return false
