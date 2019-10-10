if other.hit[P]==false && player_can_be_hit_by_hazard()
{
	other.hit[P]=true
	with other
	{
		effect_aniend(snowball_die,0.2,-2)
		instance_destroy()
	}
	
	var a;
	a=instance_create_depth(x,y,-3,ef_follower)
	a.image_speed=0.02
	a.sprite_index=hit_by_lightning_effect
	a.targ=self.id
	a.offsetx=0
	a.offsety=0

	losehp(false,"zap")
}

