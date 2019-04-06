shockwaves-=1
n+=1

var a;
a=attack_create_hitbox(25,1,true,true,true,"forwardpunch",vet_groundpunch_shockwave,0.8,99,7,3)
a.creator=creator
a.target=creator
a.x+=GAP*n
[continue]
show_debug_message("shockwave"+string(n))

if shockwaves<1
	instance_destroy()
else
{
	alarm[0]=3
}
