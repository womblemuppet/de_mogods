alarm[0]=15

var a;
a=attack_create_hitbox(30,1,false,true,true,"sunbolt",slinger_airsunbolt_spr,1,1,4,8)

a.hit_collector=self.id

for (var i = 0; i < kouchou.MAX_PLAYER_COUNT; i++)
{
	a.hit[i]=hit[i]
}
