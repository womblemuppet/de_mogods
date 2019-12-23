if instance_exists(other.creator) || other.creator==noone
{
	if other.creator!=creator
	{
		effect_aniend(die_sprite,0.2,depth)
		
		if instance_exists(creator)
			with creator
				attack_bait_reset_teleport()

		instance_destroy()
	}	
}