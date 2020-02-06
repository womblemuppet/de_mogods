if crab_being_held!=noone && crab_being_held!=undefined //error paranoia.
{
	if instance_exists(crab_being_held)
	{
		var a;
		a=attack_create_projectile(crabjectile,projectile_create_hitbox_crabjectile,9)
		a.sprite_index=crab_being_held.thrown_sprite
		a.corpse_sprite=crab_being_held.hit_sprite  //also passed down to the hitbox made in projectile script

	     with crab_being_held
	          instance_destroy()
                
	     holding_a_crab=false
	     crab_being_held=noone
	}
}
