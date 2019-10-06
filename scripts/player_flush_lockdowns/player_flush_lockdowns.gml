/***************************************************[finaledit] check everything
  more of a reset everything button
****************************************************/

uniques_fpunch_lockdown=0 
uniques_fpunch_has_made_hitbox=false
uniques_supersmash_lockdown=0
uniques_spinner_attack_lockdown=0
uniques_spinner_attack_has_made_aa_hitbox=false
uniques_spinner_attack_has_made_shockwave_hitbox=false
uniques_spinner_attack_hitbox_id=noone
uniques_sticky_mine_lockdown=0
uniques_sunblast_lockdown=0
uniques_slinger_superblast_lockdown=0
uniques_airbolt_lockdown=0
uniques_vet_kamikaze_lockdown=0
airgrab_mode="can_airgrab"
cangroundpound=0
ground_pound_freeze_counter=0
dash_rocket_jump=0
uniques_parachute=0
dash_rocket_jump=0
uniques_whirlwind_active=false
uniques_sharkattack_lockdown=0
uniques_drill_mine_place_animation_lock=false
uniques_dashgpblinkattack_lockdown=0
dash_rocket_top_collision_safety_on=false
recovery_groundpound_active=false
airgrab_slam_on=false
is_proned=false
roll_lockdown=0
before_prone_falling_lockdown=false

if uniques_phase_counter>0
	attack_slinger_phase_cancelled()

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


player_set_idle()


