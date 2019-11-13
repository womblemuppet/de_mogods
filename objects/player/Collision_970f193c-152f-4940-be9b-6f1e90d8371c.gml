if other.hit[P]==false && player_can_be_hit_by_hazard()
{
	losehp("fire")
	other.hit[P]=true
	
	var a;
	a=instance_create_depth(x,y,-3,ef_follower)
	a.image_speed=0.02
	a.sprite_index=player_hit_by_meteor_effect
	a.targ=self.id
	a.offsetx=0
	a.offsety=0
	
	cc_hit_by_hazard(self.id)	
	with aizen
		end_shitcall()

}

