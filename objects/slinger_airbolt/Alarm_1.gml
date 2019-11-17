var a;
a=attack_create_hitbox(30,1,false,true,"sunbolt_ground",slinger_airsunbolt_die_aoe_mask,0.2,99,4,6,2)
a.creator=creator
for (var i = 0; i < kouchou.MAX_PLAYER_COUNT; i++)
{
	a.hit[i]=hit[i]
}

effect_aniend(slinger_airsunbolt_die_spr,0.2,-2)
instance_destroy()