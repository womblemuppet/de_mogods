if other.hit==false
{
	losehp(false,"fire")
	with other
		hit=true
		
	cc_hit_by_orb_effect_event(self.id)
}

