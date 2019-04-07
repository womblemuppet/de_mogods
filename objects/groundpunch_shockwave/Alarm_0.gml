shockwaves-=1
n+=1

var a;
a=attack_create_hitbox(25,1,true,true,true,"forwardpunch",vet_groundpunch_shockwave,0.8,99,7,3)
a.creator=creator
a.target=-1
a.x+=GAP*n
a.image_xscale=image_xscale
a.image_blend=c_yellow


a=effect_aniend(vet_groundpunch_shockwave,0.8,-1)
a.x+=GAP*n
a.image_xscale=image_xscale

//show_debug_message("shockwave"+string(n)+" x="+string(a.x)+" y="+string(a.y))

if shockwaves<1
	instance_destroy()
else
{
	alarm[0]=TIME_INTERVAL
}
