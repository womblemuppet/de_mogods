alarm[0]=2

if collided
	exit

var a;
a=attack_create_hitbox(30,1,false,true,true,"sunbolt",slinger_airsunbolt_spr,0.7,1,4,8)
a.creator=creator
a.image_blend=c_red
a.hit_collector=self.id

for (var i = 0; i < kouchou.MAX_PLAYER_COUNT; i++)
{
	a.hit[i]=hit[i]
}
