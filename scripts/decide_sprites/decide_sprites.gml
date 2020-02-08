/***************************************************
  decide_sprites
 ***************************************************/

sprites=ds_map_create();   ///[finaledit] clean up on death
 
switch character
{
	case "ooga":
	{
		if palette==0
		{
			supersparkle_sprite=P1_saiyanaura 

            
			if H==3 || H==4 || H==5
			{
				sprites[? "gp_effect_sprite"]=Ooga_gp_effect
				sprites[? "rocketjump"]=Ooga_4H_rocketjump
				sprites[? "rocketjump_u"]=Ooga_U_rocketjump
				sprites[? "rocketjump_charge"]=Ooga_4H_rocketjump_charge
				sprites[? "rocketjump_charge_u"]=Ooga_U_rocketjump_charge
				sprites[? "rocketjump_effect"]=Ooga_rjump_effect_spr
				sprites[? "airgrab"]=Ooga_4H_airgrab_slam
				sprites[? "airgrab_u"]=Ooga_4H_airgrab_slam //super version (to be changed)
				sprites[? "death_acid"]=Ooga_death_by_acid
				sprites[? "death_zap"]=Ooga_death_by_zap
				sprites[? "death_ice"]=Ooga_death_by_ice
				sprites[? "airslam"]=Ooga_4H_airgrab_slam
				sprites[? "airslam_u"]=Ooga_4H_airgrab_slam //super version (to be changed)
				sprites[? "recoiling_u"]=Ooga_4H_recoiling_super
				sprites[? "recoiling_air"]=Ooga_4H_recoiling_air
				sprites[? "recoiling_air_flip"]=Ooga_4H_recoiling_air_flip
				sprites[? "recoiling_fall"]=Ooga_4H_recoiling_fall
				sprites[? "recoiling"]=Ooga_4H_recoiling
				sprites[? "airgrab_u"]=Ooga_4H_airgrab  ///super version (to be changed)
				sprites[? "airgrab"]=Ooga_4H_airgrab 
				sprites[? "uniques_falconpunch_u"]=Ooga_4H_falconpunch  ///super version (to be changed)
				sprites[? "uniques_falconpunch"]=Ooga_4H_falconpunch
				sprites[? "uniques_falconpunch_fullcharge_u"]=Ooga_4H_falconpunch_fullcharge  ///super version (to be changed)
				sprites[? "uniques_falconpunch_fullcharge"]=Ooga_4H_falconpunch_fullcharge
				sprites[? "uniques_supersmash"]=Ooga_4H_super_smash
				sprites[? "uniques_supersmash_u"]=Ooga_4H_super_smash
				sprites[? "dizzy_u"]=Ooga_4H_dizzy   ///super version (to be changed)
				sprites[? "dizzy"]=Ooga_4H_dizzy
				sprites[? "light_attack_u"]=Ooga_U_uppercut
				sprites[? "light_attack"]=Ooga_4H_uppercut
				sprites[? "dash_u"]=Ooga_U_charge 
				sprites[? "dash"]=Ooga_4H_charge
				sprites[? "death_fall"]=Uga_death_by_fall
				sprites[? "idle"]=Ooga_4H_idle
				sprites[? "run"]=Ooga_4H_run
				sprites[? "jump"]=Ooga_4H_jump
				sprites[? "air"]=Ooga_4H_air
				sprites[? "fall"]=Ooga_4H_fall
				sprites[? "landing"]=Ooga_4H_landing
				sprites[? "landing_u"]=Ooga_4H_landing
				sprites[? "gpfall"]=Ooga_4H_gpfall
				sprites[? "super_activate"]=Ooga_pal1_ult_actiavte
				sprites[? "gpfall_u"]=Ooga_U_gpfall
				sprites[? "gpland_whiff"]=Ooga_4H_gp_landing_whiff
				sprites[? "gpland_whiff_u"]=Ooga_4H_gp_landing_whiff
				sprites[? "run_u"]=Ooga_U_run
				sprites[? "idle_u"]=Ooga_U_idle
				sprites[? "jump_u"]=Ooga_U_jump
				sprites[? "air_u"]=Ooga_U_air
				sprites[? "fall_u"]=Ooga_U_fall
				sprites[? "ritual"]=Ooga_4H_envoke
				sprites[? "prone"]=Ooga_4H_prone
				sprites[? "roll"]=Ooga_4H_roll
				sprites[? "knockdown_air"]=Ooga_4H_knockdown_air
				sprites[? "climb"]=Ooga_4H_climb
				sprites[? "yeet"]=Ooga_4H_yeet
				sprites[? "yeet_u"]=Ooga_4H_yeet  ///super version (to be changed)
			}
		}
/*        else if palette==1
        {
            supersparkle_sprite=P1_saiyanaura  */

	} break;
    
	case "veteran":
	{
		if palette==0
		{
			supersparkle_sprite=P1_saiyanaura 
			sprites[? "uniques_place_mine"]=Vet_3H_place_mine
			sprites[? "gp_effect_sprite"]=Vet_groundpound_effect
			sprites[? "rocketjump"]=Vet_3H_rocketjump
			sprites[? "rocketjump_u"]=Vet_3H_rocketjump   ///super version (to be changed)
			sprites[? "rocketjump_charge"]=Vet_3H_rocketjump_charge
			sprites[? "rocketjump_charge_u"]=Vet_3H_rocketjump_charge  ///super version (to be changed)
			sprites[? "rocketjump_effect"]=Vet_rjump_effect_spr
			sprites[? "recoiling_u"]=Vet_3H_recoiling  ///super version (to be changed)
			sprites[? "recoiling"]=Vet_3H_recoiling
			sprites[? "recoiling_air"]=Vet_3H_recoiling_air
			sprites[? "recoiling_air_flip"]=Vet_3H_recoiling_air_flip
			sprites[? "recoiling_fall"]=Vet_3H_recoiling_fall
			sprites[? "airgrab_u"]=Vet_3H_airgrab  ///super version (to be changed)
			sprites[? "airgrab"]=Vet_3H_airgrab
			sprites[? "airslam"]=Vet_3H_airslam
			sprites[? "airslam_u"]=Vet_3H_airslam ///super version (to be changed)
			sprites[? "uniques_throw_targetted_mine"]=Vet_3H_attach_sticky_mine
			sprites[? "uniques_throw_targetted_mine_u"]=Vet_3H_attach_sticky_mine //super version (to be changed)
			sprites[? "uniques_dig_place_mine"]=Vet_3H_dig_placed
			sprites[? "uniques_dig_place_mine_u"]=Vet_3H_dig_placed //super version (to be changed)
			sprites[? "uniques_dig_u"]=Vet_3H_dig_h  ////super version (to be changed)
			sprites[? "uniques_dig"]=Vet_3H_dig_h 
			sprites[? "uniques_dig_channel_u"]=Vet_3H_dig_channel   ///super version (to be changed)
			sprites[? "uniques_dig_channel"]=Vet_3H_dig_channel
			sprites[? "uniques_parachute_u"]=Vet_3H_fall_parachute  ///super version (to be changed)
			sprites[? "uniques_parachute"]=Vet_3H_fall_parachute
			sprites[? "uniques_spinattack"]=Vet_3H_spinattack  ///super version (to be changed)
			sprites[? "uniques_spinattack_u"]=Vet_3H_spinattack
			sprites[? "uniques_kamikaze"]=Vet_3H_super_charge
			sprites[? "dizzy_u"]=Vet_3H_dizzy  //super version
			sprites[? "dizzy"]=Vet_3H_dizzy
			sprites[? "light_attack_u"]=Vet_3H_uppercut  //super version
			sprites[? "light_attack"]=Vet_3H_uppercut
			sprites[? "dash_u"]=Vet_3H_charge    ////super version (to be changed) 
			sprites[? "dash"]=Vet_3H_charge
			sprites[? "death_fall"]=Vet_death_by_fall
			sprites[? "idle"]=Vet_3H_idle_E
			sprites[? "run"]=Vet_3H_run
			sprites[? "jump"]=Vet_3H_jump
			sprites[? "air"]=Vet_3H_air 
			sprites[? "fall"]=Vet_3H_fall
			sprites[? "landing"]=Vet_3H_landing
			sprites[? "landing_u"]=Vet_3H_landing
			sprites[? "gpfall"]=Vet_3H_gpfall
			sprites[? "super_activate"]=Ooga_pal1_ult_actiavte
			sprites[? "gpfall_u"]=Vet_3H_gpfall  //super version
			sprites[? "gpland_whiff"]=Ooga_4H_gp_landing_whiff
			sprites[? "gpland_whiff_u"]=Ooga_4H_gp_landing_whiff
			sprites[? "run_u"]=Vet_3H_run    //super version
			sprites[? "idle_u"]=Vet_3H_idle_E //super version
			sprites[? "jump_u"]=Vet_3H_jump  //super version
			sprites[? "air_u"]=Vet_3H_air  //super version
			sprites[? "fall_u"]=Vet_3H_fall  //super version
			sprites[? "death_acid"]=Vet_death_by_acid
			sprites[? "death_zap"]=Vet_death_by_zap
			sprites[? "death_ice"]=Vet_death_by_ice
			sprites[? "ritual"]=Vet_3H_envoke
			sprites[? "prone"]=Vet_3H_prone
			sprites[? "roll"]=Vet_3H_roll
			sprites[? "knockdown_air"]=Vet_3H_knockdown_air
			sprites[? "climb"]=Ooga_4H_climb
		}
	}break;
    
	case "slinger":
	{
		if palette==0
		{
			supersparkle_sprite=P1_saiyanaura 
			sprites[? "uniques_airsunbolt_u"]=Slinger_3H_airsunbolt  ///super version (to be changed)
			sprites[? "uniques_airsunbolt"]=Slinger_3H_airsunbolt
			sprites[? "uniques_cracklingbeam_u"]=Slinger_3H_sunbolt  ///super version (to be changed)
			sprites[? "uniques_cracklingbeam"]=Slinger_3H_sunbolt 
			sprites[? "uniques_superblast"]=Slinger_3H_superblast
			sprites[? "rocketjump"]=Slinger_3H_rocketjump
			sprites[? "rocketjump_u"]=Slinger_3H_rocketjump
			sprites[? "rocketjump_charge"]=Slinger_3H_rocketjump_charge
			sprites[? "rocketjump_charge_u"]=Slinger_3H_rocketjump_charge  ///super version (to be changed)
			sprites[? "rocketjump_effect"]=Slinger_rjump_effect_spr
			sprites[? "gp_effect_sprite"]=Slinger_groundpound_effect
			sprites[? "recoiling_u"]=Slinger_3H_recoiling  ///super version (to be changed)
			sprites[? "recoiling"]=Slinger_3H_recoiling
			sprites[? "recoiling_air"]=Slinger_3H_recoiling_air
			sprites[? "recoiling_air_flip"]=Slinger_3H_recoiling_air_flip
			sprites[? "recoiling_fall"]=Slinger_3H_recoiling_fall
			sprites[? "airgrab_u"]=Slinger_3H_airgrab  ///super version (to be changed)
			sprites[? "airgrab"]=Slinger_3H_airgrab  
			sprites[? "airslam"]=Slinger_3H_airslam ///super version (to be changed)
			sprites[? "airslam_u"]=Slinger_3H_airslam
			sprites[? "dizzy_u"]=Slinger_3H_dizzy  ///super version (to be changed)
			sprites[? "dizzy"]=Slinger_3H_dizzy
			sprites[? "light_attack_u"]=Vet_3H_uppercut   ///super version (to be changed)
			sprites[? "light_attack"]=Vet_3H_uppercut
			sprites[? "dash_u"]=Slinger_3H_charge    ////super version (to be changed) 
			sprites[? "dash"]=Slinger_3H_charge
			sprites[? "death_fall"]=Slinger_death_by_fall
			sprites[? "idle"]=Slinger_3H_idle
			sprites[? "run"]=Slinger_3H_run
			sprites[? "jump"]=Slinger_3H_jump
			sprites[? "air"]=Slinger_3H_air 
			sprites[? "fall"]=Slinger_3H_fall
			sprites[? "landing"]=Slinger_3H_landing
			sprites[? "landing_u"]=Slinger_3H_landing
			sprites[? "gpfall"]=Slinger_3H_gpfall
			sprites[? "super_activate"]=Ooga_pal1_ult_actiavte
			sprites[? "gpfall_u"]=Slinger_3H_gpfall  ///super version (to be changed)
			sprites[? "gpland_whiff"]=Ooga_4H_gp_landing_whiff
			sprites[? "gpland_whiff_u"]=Ooga_4H_gp_landing_whiff
			sprites[? "run_u"]=Slinger_3H_run  ///super version (to be changed)
			sprites[? "idle_u"]=Slinger_3H_idle  ///super version (to be changed)
			sprites[? "jump_u"]=Slinger_3H_jump  ///super version (to be changed)
			sprites[? "air_u"]=Slinger_3H_air  ///super version (to be changed)
			sprites[? "fall_u"]=Slinger_3H_fall      ///super version (to be changed)
			sprites[? "death_acid"]=Slinger_death_by_acid
			sprites[? "death_zap"]=Slinger_death_by_zap
			sprites[? "death_ice"]=Slinger_death_by_ice
			sprites[? "phase"]=Slinger_3H_phaseblink
			sprites[? "phase_u"]=Slinger_3H_phaseblink  ///super version (to be changed)
			sprites[? "phase_entry"]=Slinger_3H_phaseblink_entry
			sprites[? "ritual"]=Slinger_3H_envoke
			sprites[? "prone"]=Slinger_3H_prone
			sprites[? "roll"]=Slinger_3H_roll
			sprites[? "knockdown_air"]=Slinger_3H_knockdown_air
			sprites[? "climb"]=Ooga_4H_climb
		}
	} break;
	
	case "bait":
	{
		supersparkle_sprite=P1_saiyanaura 
		sprites[? "uniques_supergrab"]=Bait_3H_supergrab
		sprites[? "uniques_blinkjump_windup"]=Bait_3H_blinkjump_windup
		sprites[? "uniques_blinkjump_windup_u"]=Bait_3H_blinkjump_windup //super version (to be changed)
		sprites[? "uniques_whirlwind"]=Bait_3H_spin
		sprites[? "uniques_use_teleport_in_whirlwind"]=Bait_3H_spin_use_teleport
		sprites[? "uniques_use_teleport"]=Bait_3H_use_teleport
		sprites[? "uniques_place_teleport"]=Bait_3H_place_teleport
		sprites[? "teleport_spawn"]=spr_teleport_anchor_spawn
		sprites[? "teleport_placed"]=spr_teleport_anchor
		sprites[? "teleport_die"]=spr_teleport_anchor_die
		sprites[? "uniques_heavyswing"]=Bait_3H_heavypunch
		sprites[? "uniques_heavyswing_u"]=Bait_3H_heavypunch   ///super version (to be changed)
		sprites[? "rocketjump"]=Bait_3H_rocketjump
		sprites[? "rocketjump_u"]=Bait_3H_rocketjump
		sprites[? "rocketjump_charge"]=Bait_3H_rocketjump_charge
		sprites[? "rocketjump_charge_u"]=Bait_3H_rocketjump_charge  ///super version (to be changed)
		sprites[? "rocketjump_effect"]=Bait_rjump_effect_spr
		sprites[? "gp_effect_sprite"]=Bait_groundpound_effect
		sprites[? "recoiling_u"]=Bait_3H_recoiling  ///super version (to be changed)
		sprites[? "recoiling"]=Bait_3H_recoiling
		sprites[? "recoiling_air"]=Bait_3H_recoiling_air
		sprites[? "recoiling_air_flip"]=Bait_3H_recoiling_air_flip
		sprites[? "recoiling_fall"]=Bait_3H_recoiling_fall
		sprites[? "airgrab_u"]=Bait_3H_airgrab  ///super version (to be changed)
		sprites[? "airgrab"]=Bait_3H_airgrab 
		sprites[? "airslam"]=Bait_3H_airslam ///super version (to be changed)
		sprites[? "airslam_u"]=Bait_3H_airslam
		sprites[? "dizzy_u"]=Bait_3H_dizzy  ///super version (to be changed)
		sprites[? "dizzy"]=Bait_3H_dizzy
		sprites[? "light_attack_u"]=Bait_3H_uppercut   ///super version
		sprites[? "light_attack"]=Bait_3H_uppercut
		sprites[? "dash_u"]=Bait_3H_dash    ////super version (to be changed) 
		sprites[? "dash"]=Bait_3H_dash
		sprites[? "death_fall"]=Bait_death_by_fall
		sprites[? "idle"]=Bait_3H_idle
		sprites[? "run"]=Bait_3H_run
		sprites[? "jump"]=Bait_3H_jump
		sprites[? "air"]=Bait_3H_air 
		sprites[? "fall"]=Bait_3H_fall
		sprites[? "landing"]=Bait_3H_landing
		sprites[? "landing_u"]=Bait_3H_landing
		sprites[? "gpfall"]=Bait_3H_gpfall
		sprites[? "super_activate"]=Ooga_pal1_ult_actiavte
		sprites[? "gpfall_u"]=Bait_3H_gpfall  //super version
		sprites[? "gpland_whiff"]=Ooga_4H_gp_landing_whiff
		sprites[? "gpland_whiff_u"]=Ooga_4H_gp_landing_whiff
		sprites[? "run_u"]=Bait_3H_run_super_mode  //super version
		sprites[? "idle_u"]=Bait_3H_idle_super_mode  //super version
		sprites[? "jump_u"]=Bait_3H_jump  //super version
		sprites[? "air_u"]=Bait_3H_air  //super version
		sprites[? "fall_u"]=Bait_3H_fall      //super version          
		sprites[? "death_acid"]=Bait_death_by_acid
		sprites[? "death_zap"]=Bait_death_by_zap
		sprites[? "death_ice"]=Bait_death_by_ice
		sprites[? "ritual"]=Bait_3H_envoke
		sprites[? "prone"]=Bait_3H_prone
		sprites[? "roll"]=Bait_3H_roll
		sprites[? "knockdown_air"]=Bait_3H_knockdown_air
		sprites[? "climb"]=Ooga_4H_climb
	} break;
    
	default:
		show_error("unknown character ID, sprite decision fail",true)
    
}

