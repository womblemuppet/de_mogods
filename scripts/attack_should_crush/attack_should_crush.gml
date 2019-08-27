/*
  attack_special_crush(incoming attack type)
  
  returns true if move should not collide with caller
*/

if argument0=="rocket jump"
{
	if cangroundpound==2
	{
		effect_create_above(ef_firework,x,y,2,c_orange)
		//player_flush_lockdowns()
		//attack_stop_groundpound()
		return true
	}
}


return false