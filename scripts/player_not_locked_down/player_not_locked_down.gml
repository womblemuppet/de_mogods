/***************************************************
  player_not_locked_down()   //[finaledit] do check of every attack
****************************************************/

//// keep adding to it it'll be fine

if fpunch_lockdown==0 && uniques_aapunch_lockdown==0 && uniques_forwardpunch_lockdown==0 && uniques_sunblast_lockdown==0 && uniques_sharkattack_lockdown==0 && airgrab_mode==0 && cangroundpound!=1 && cangroundpound!=2 && dash_rocket_jump!=1 && dash_rocket_jump!=2 && uniques_whirlwind_active==false && uniques_vet_digging==0
	return true
return false
