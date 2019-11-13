smoke_effect_counter-=1
if smoke_effect_counter==0
{
	smoke_effect_counter=4
	
	var a;
	a=effect_aniend(meteor_smoke,0.20,-1)  //[finaledit] depth ??
	a.y-=48
	a.vspeed=-1.5
	a.hspeed=-1
}

image_angle=direction  //necessary to have in step for push arc

life++
if life>3000
	instance_destroy()