/***************************************************[finaledit] check everything
  more of a reset everything button
****************************************************/

fpunch_lockdown=0 
fpunch_has_made_hitbox=false
uniques_aapunch_lockdown=0
uniques_aapunch_has_made_hitbox=false
uniques_aapunch_has_made_hitbox2=false
uniques_forwardpunch_lockdown=0
uniques_forwardpunch_has_made_hitbox=false
uniques_sticky_mine_lockdown=0
uniques_sunblast_lockdown=0
uniques_airbolt_lockdown=0
airgrab_mode="can_airgrab"
cangroundpound=0
dash_rocket_jump=0
uniques_parachute=0
dash_rocket_jump=0
uniques_whirlwind_active=false
uniques_sharkattack_lockdown=0
uniques_drill_mine_place_animation_lock=false
uniques_dashgpblinkattack_lockdown=0
uniques_slam_airgrab_slam_lockdown=0
uniques_phase_counter=0

if uniques_vet_dig_enabled
{
	if uniques_vet_digging!=0
	{
		attack_vet_dig_cancel()
		uniques_vet_digging=0
	}
	
}

if airgrab_target!=noone
{
	if instance_exists(airgrab_target)
	{
		with airgrab_target
		{
			if airgrab_mode=="being_airgrabbed"
				airgrab_mode="cannot_airgrab"
		}
	}
	airgrab_target=noone
}
if uniques_slam_airgrab_target!=noone
{
	if instance_exists(uniques_slam_airgrab_target)
	{
		with uniques_slam_airgrab_target
		{
			if airgrab_mode=="being_airgrabbed"
				airgrab_mode="cannot_airgrab"
		}
	}
	uniques_slam_airgrab_target=noone
}

player_set_idle()


