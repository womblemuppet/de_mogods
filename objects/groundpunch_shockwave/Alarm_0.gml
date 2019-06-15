shockwaves-=1
n+=1

var a;
a=attack_create_hitbox(25,1,true,true,true,"forwardpunch",vet_groundpunch_shockwave,0.8,99,7,3)
a.creator=creator
a.target=-1
a.x+=GAP*n
a.image_xscale=image_xscale
a.hit_collector=self.id


for (var i = 0; i < kouchou.MAX_PLAYER_COUNT; i++)
{
	a.hit[i]=hit[i]
}


a=effect_aniend(vet_groundpunch_shockwave,0.8,-1)
a.x+=GAP*n
a.image_xscale=image_xscale

if shockwaves<1
	instance_destroy()
else
{
	alarm[0]=TIME_INTERVAL
}
