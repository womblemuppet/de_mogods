/***************************************************
  player hit by attack
  
****************************************************/

if instance_exists(other.creator)                  /////////// ON HIT   //////////////////
{
	if other.hit[P]==false && other.creator!=self.id  ///hit by enemy attack
	{
		player_generic_knockback(other.my_hknockback,other.my_vknockback)
		player_whacked(other.stunamount,other.numberofhh,other.reset_attacker_hh,other.reset_opponent,other.gains_meter_on_hit)
		moves_special_properties(other.attackname)
	}
	//if other.hit[P]==false && other.creator==self.id   ///hit by own attack
	//{
	//	switch other.attackname
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
