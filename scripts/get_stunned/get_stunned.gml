/*
	get_stunned(stun amount, use stun animation)
	use whole numbers for stun amount, non-integer stun amounts will never count to 0
*/
hspd=0
STUNNED2=argument0 
player_flush_lockdowns()
if argument1
{
	sprite_index=sprites[19]
	if super_mode
		sprite_index=sprites[20]
	image_speed=0.08
	var a;
	a=instance_create(x,y-11,ef_stunspiral)
	a.offsetx=0
	a.offsety=0
	a.targ=self.id
	a.image_xscale=image_xscale
	a.image_yscale=image_yscale
	a.image_speed=FRAME_SPEED_SLOW
}
