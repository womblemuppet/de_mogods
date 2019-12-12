if player_not_locked_down()
{
	if uniques_phase_landing_attack_disable_counter>0
		return false
	
	if push_other_attacks_timer<1 && dash_delay_before_can_attack_counter<1 && !player_is_staggered() && !player_is_stunned() && is_proned==false
		return true
	else 
		return false
}
else
	return false
