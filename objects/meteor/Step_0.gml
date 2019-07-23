if instance_exists(wave)
{
	if wave.y+20<y
	{
		if sprite_index!=meteor_sprite_cold
			effect_aniend(splash_effect1,0.2,0)
		sprite_index=meteor_sprite_cold
	}
}

smoketicker+=1
if smoketicker mod 4 ==0
{
	var a;
	a=effect_aniend(meteor_smoke,0.20,-1)  //[finaledit] depth ??
	a.y-=48
	a.vspeed=-1.5
	a.hspeed=-1
}

image_angle=direction  //necessary to have in step for push arc

