if create_corpse
{
	var a;
	a=instance_create_depth(x,y,-3,corpse)
	a.sprite_index=corpse_sprite
	a.vspeed=-5
	a.hspeed=choose(speed/2,-speed/2)
	a.gravity=0.5
}