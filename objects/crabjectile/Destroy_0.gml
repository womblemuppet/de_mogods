if create_corpse
{
	var a;
	a=instance_create_depth(x,y,-1,corpse)
	a.sprite_index=corpse_sprite
	a.vspeed=-5
	a.hspeed=choose(speed/2,-speed/2)
	a.gravity=0.2
}