/***************************************************
  player_not_locked_down()   //[finaledit] do check of every attack
****************************************************/

//// keep adding to it it'll be fine

if uniques_fpunch_lockdown==0 
&& uniques_spinner_attack_lockdown==0 
&& uniques_sunblast_lockdown==0 
&& uniques_sharkattack_lockdown==0 
&& airgrab_mode=="can_airgrab" 
&& cangroundpound!=1 
&& cangroundpound!=2 
&& dash_rocket_jump!=1 
&& dash_rocket_jump!=2 
&& uniques_whirlwind_active==false 
&& uniques_vet_digging==0 
&& uniques_airbolt_lockdown==0 
&& uniques_sticky_mine_lockdown==0 
&& uniques_dashgpblinkattack_lockdown==0 
&& uniques_vet_kamikaze_lockdown==0
	return true
return false
