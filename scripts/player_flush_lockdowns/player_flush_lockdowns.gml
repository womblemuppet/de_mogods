/***************************************************
  more of a reset everything button
****************************************************/

fpunch_lockdown=0 
fpunch_has_made_hitbox=false
uniques_aapunch_lockdown=0
uniques_aapunch_has_made_hitbox=false
uniques_aapunch_has_made_hitbox2=false
uniques_forwardpunch_lockdown=0
uniques_forwardpunch_has_made_hitbox=false
uniques_sunblast_lockdown=0
uniques_airbolt_lockdown=0
airgrab_mode=0
cangroundpound=0
dash_rocket_jump=0
uniques_parachute=0
dash_rocket_jump=0
uniques_whirlwind_active=false

if uniques_vet_dig_enabled
{
	if uniques_vet_digging!=0
	{
		attack_vet_dig_cancel()
		uniques_vet_digging=0
	}
	
}

player_set_idle()


