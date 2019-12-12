/***************************************************
  player_not_locked_down()   //[finaledit] do check of every attack
****************************************************/

//// keep adding to it it'll be fine

if !player_is_stunned()
&& uniques_fpunch_lockdown==0 
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
&& uniques_dashgpblinkattack_lockdown==0 
&& uniques_vet_kamikaze_lockdown==0
&& uniques_slinger_superblast_lockdown==0
&& uniques_supersmash_lockdown==0
&& roll_lockdown==0
&& ritual_lockdown==0
&& is_proned==false
&& before_prone_falling_lockdown==0
&& groundpound_whiff_lockdown==0
	return true
return false
