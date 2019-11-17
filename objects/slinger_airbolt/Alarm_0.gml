alarm[0]=2

if collided
	exit

var a;
a=attack_create_hitbox(30,1,false,true,"sunbolt",slinger_airsunbolt_spr,0.7,1,4,8,2)   ///only one active frame, fast img speed
a.creator=creator
a.image_blend=c_red
a.hit_collector=self.id
a.image_xscale=1
a.image_yscale=1

for (var i = 0; i < kouchou.MAX_PLAYER_COUNT; i++)
{
	a.hit[i]=hit[i]
}
