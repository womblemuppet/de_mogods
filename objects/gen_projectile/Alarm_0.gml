var a;
a=script_execute(hitbox_properties_script)
a.creator=creator
a.hit_collector=self.id
for (var i = 0; i < kouchou.MAX_PLAYER_COUNT; i++)
{
	a.hit[i]=hit[i]
}

alarm[0]=3
can_collide_with_terrain=true