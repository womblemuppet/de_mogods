/*
  player_can_phase
  will cancel sunblast/airbolt lockdowns if called so be careful when checking
*/

if player_may_attack()
	return true
	
if uniques_cracklingbeam_lockdown==1 || uniques_cracklingbeam_lockdown==2
{
	uniques_cracklingbeam_lockdown=0
	return true
}
	
if uniques_airbolt_lockdown==1 || uniques_airbolt_lockdown==2
{
	uniques_airbolt_lockdown=0
	return true
}

return false