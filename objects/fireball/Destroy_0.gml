effect_aniend(fireball_explosion_spr,0.2,-2)

var a;
a=attack_create_hitbox(30,1,false,true,"fireball explosion",fireball_explosion_spr,0.2,99,4,-4,2)
a.creator=creator
for (var i = 0; i < kouchou.MAX_PLAYER_COUNT; i++)
{
	a.hit[i]=hit[i]
}

