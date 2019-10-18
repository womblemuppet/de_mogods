/*
	player_get_gp_stunned(stun amount)
	use whole numbers for stun amount, non-integer stun amounts will never count to 0
*/

if armouredsteps>0
{
	effect_aniend(armoured_get_hit_spr,0.2,-4)
	exit
}

hspd=0
stunned=0
stunned_groundpound=argument0
player_flinch(argument0)
player_flush_lockdowns()

sprite_index=sprites[? "dizzy"]
if super_mode
	sprite_index=sprites[? "dizzy_u"]
	
image_speed=0.08
var a;
a=instance_create(x,y-11,ef_follower)
a.offsetx=0
a.offsety=0
a.targ=self.id
a.image_xscale=image_xscale
a.image_yscale=image_yscale
a.image_speed=FRAME_SPEED_SLOW

