/***************************************************
  player hit by dash  
****************************************************/

if instance_exists(other.creator) || other.creator==noone                  /////////// ON HIT   //////////////////
{
	if other.hit[P]==false && other.creator!=self.id
	{
		other.hit[P]=true
		if attack_should_crush(other.attack_name)
			exit
		player_dashed_into(other.my_stunamount,other.my_hknockback,other.my_vknockback)
		attack_apply_special_properties(other.attack_name)
	}
}
