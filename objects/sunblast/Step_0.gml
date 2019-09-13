var a;
a=attack_create_hitbox(30,1,false,true,"sunblast",sunblast_sprite,1,99,7,4)
a.creator=creator
a.hit_collector=self.id
for (var i = 0; i < kouchou.MAX_PLAYER_COUNT; i++)
{
	a.hit[i]=hit[i]
}
