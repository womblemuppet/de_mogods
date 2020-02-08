if crab_being_held!=noone && crab_being_held!=undefined //error paranoia.
{
	if instance_exists(crab_being_held)
	{
		throw_crab_has_made_crab=false
		throw_crab_lockdown=1
		image_index=0
		sprite_index=sprites[? "yeet"]
		if super_mode_available
			sprite_index=sprites[? "yeet"]
		image_speed=FRAME_SPEED_NORMAL

		crab_being_thrown_corpse_sprite_on_interrupt=crab_being_held.hit_sprite
		crab_being_thrown_thrown_sprite=crab_being_held.thrown_sprite
		crab_being_thrown_hit_sprite=crab_being_held.hit_sprite
			
	     with crab_being_held
	          instance_destroy()
                
	     holding_a_crab=false
	     crab_being_held=noone	
	}
}
