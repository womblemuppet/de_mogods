/***************************************************
  player hit by attack
  (when colliding with hitbox, or sunblast apparently)
****************************************************/


if instance_exists(other.creator) || other.creator==noone                   /////////// ON HIT   //////////////////
{
	if other.hit[P]==false && other.creator!=self.id  ///hit by enemy attack
	{
		other.hit[P]=true
		if other.hit_collector!=noone
		{
			if instance_exists(other.hit_collector)
				other.hit_collector.hit[P]=true
		}
		if !attack_should_crush(other.attack_name) && iframes<1
		{
			player_generic_knockback(other.my_hknockback,other.my_vknockback)
			player_whacked(other.stunamount,other.numberofhh,other.reset_attacker_hh,other.reset_opponent)
			moves_special_properties(other.attack_name)
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
