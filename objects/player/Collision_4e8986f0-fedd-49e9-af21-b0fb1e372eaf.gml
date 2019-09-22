if instance_exists(wave)  //[finaledit] is this a thing?
{
	if y>wave.y
		exit

		
	cc_hit_by_orb_effect_event(self.id)
}

		
var a;
a=instance_create_depth(x,y,-3,ef_follower)
a.image_speed=0.02
a.sprite_index=hit_by_lightning_effect
a.targ=self.id
a.offsetx=0
a.offsety=0

losehp(false,"zap")



