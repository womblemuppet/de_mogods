/***************************************************
  player hit by attack
  (when colliding with hitbox)
****************************************************/
	
if instance_exists(other.creator) || other.creator==noone                   /////////// ON HIT   //////////////////
{
	if other.hit[P]==false && other.creator!=self.id  ///if hitbox owned by enemy and not yet hit
	{
		if player_is_hittable(other.attack_name)
		{
			player_generic_knockback(other.my_hknockback,other.my_vknockback)
			player_whacked(other.stunamount,other.numberofhh,other.reset_attacker_hh,other.reset_opponent)
			apply_special_attack_properties(other.attack_name)
		}
	}
	//if other.hit[P]==false && other.creator==self.id   ///hit by own attack
	//{
	//	switch other.attack_name
	//	{
	//		case "mineexplosion":     //// mine jump  minejump 
	//		{
	//			if !place_meeting(x,y-1,block)
	//				y-=1
	//			vspd=-10.5
	//			doublejump=1
	//			doublejumptimer=DOUBLEJUMPTIME*3   ///give player lots of time for double jump 
	//			other.hit[P]=true
                
	//		}   break;

	//	}
	//}
}


///set hitbox status to collided with
other.hit[P]=true
if other.hit_collector!=noone
{
	if instance_exists(other.hit_collector)
		other.hit_collector.hit[P]=true
}
	