var b;
b=create_terrain_cutter(ooga_ultimate_groundpound_shockwave_cutter, "pushed", direction,6)
b.alarm[0]=1

life-=1
if life<1 && sprite_index!=die_sprite
{
	for (var i=0; i<kouchou.MAX_PLAYER_COUNT; i+=1)
	{
		hit[i]=true
	};

	sprite_index=die_sprite
	image_index=0
}

///don't inherit event, we don't want targ functionality