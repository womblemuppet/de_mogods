if player_not_locked_down()
{
	if push_other_attacks_timer<1 && dash_attacks_allowed_counter<1 && stunned<1 && stunned_groundpound<1
		return true
	else 
		return false
}
else
	return false
