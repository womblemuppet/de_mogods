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
			sentinel_colour=c_purple

            
			if H==3 || H==4 || H==5
			{
				sprites[? "gp_hit_ground_effect"]=Ooga_gp_effect
				sprites[? "rocketjump"]=Ooga_4H_rocketjump
				sprites[? "rocketjump_u"]=Ooga_U_rocketjump
				sprites[? "rocketjump_charge"]=Ooga_4H_rocketjump_charge
				sprites[? "rocketjump_charge_u"]=Ooga_U_rocketjump_charge
				sprites[? "rocketjump_effect"]=Ooga_rjump_effect_spr
				sprites[? "airgrab"]=Ooga_4H_airgrab_slam
				sprites[? "airgrab_u"]=Ooga_4H_airgrab_slam //super version (to be changed)
				sprites[36]=Ooga_4H_airgrab_slam_down
				sprites[37]=Ooga_4H_airgrab_slam_down //super version (to be changed)
				sprites[? "death_acid"]=Ooga_death_by_acid
				sprites[? "death_zap"]=Ooga_death_by_zap
				sprites[? "death_ice"]=Ooga_death_by_ice
				sprites[? "recoiling_u"]=Ooga_4H_recoiling_super
				sprites[? "recoiling"]=Ooga_4H_recoiling
				sprites[? "airgrab_u"]=Ooga_4H_airgrab  ///super version (to be changed)
				sprites[? "airgrab"]=Ooga_4H_airgrab 
				sprites[? "falconpunch_u"]=Ooga_4H_falconpunch  ///super version (to be changed)
				sprites[? "falconpunch"]=Ooga_4H_falconpunch
				sprites[? "dizzy_u"]=Ooga_4H_dizzy   ///superversion (to be chnageD)
				sprites[? "dizzy"]=Ooga_4H_dizzy
				sprites[? "light_attack_u"]=Ooga_U_uppercut
				sprites[? "light_attack"]=Ooga_4H_uppercut
				sprites[? "dash_u"]=Ooga_U_charge 
				sprites[? "dash"]=Ooga_4H_charge
				sprites[14]=goldboi
				sprites[? "death_fall"]=P1_corpse
				sprites[? "idle"]=Ooga_4H_idle
				sprites[? "run"]=Ooga_4H_run
				sprites[? "jump"]=Ooga_4H_jump
				sprites[? "air"]=Ooga_4H_air 
				sprites[? "fall"]=Ooga_4H_fall
				sprites[? "gpfall"]=Ooga_4H_gpfall
				sprites[? "super_activate"]=Ooga_pal1_ult_actiavte
				sprites[? "gpfall_u"]=Ooga_U_gpfall
				sprites[? "run_u"]=Ooga_U_run
				sprites[? "idle_u"]=Ooga_U_idle
				sprites[? "jump_u"]=Ooga_U_jump
				sprites[? "air_u"]=Ooga_U_air
				sprites[? "fall_u"]=Ooga_U_fall
			}
		}
/*        else if palette==1
        {
            supersparkle_sprite=P1_saiyanaura  
            sentinel_colour=c_yellow   */

	} break;
    
	case "veteran":
	{
		if palette==0
		{
			supersparkle_sprite=P1_saiyanaura 
			sentinel_colour=c_purple     
			sprites[32]=Vet_3H_place_mine
			sprites[? "gp_hit_ground_effect"]=groundpoundeffect
			sprites[? "rocketjump"]=Vet_3H_rocketjump
			sprites[? "rocketjump_u"]=Vet_3H_rocketjump   ///super version (to be changed)
			sprites[? "rocketjump_charge"]=Vet_3H_rocketjump_charge
			sprites[? "rocketjump_charge_u"]=Vet_3H_rocketjump_charge  ///super version (to be changed)
			sprites[? "rocketjump_effect"]=Vet_rjump_effect_spr
			sprites[? "recoiling_u"]=Vet_3H_recoiling  ///super version (to be changed)
			sprites[? "recoiling"]=Vet_3H_recoiling
			sprites[? "airgrab_u"]=Vet_3H_airgrab  ///super version (to be changed)
			sprites[? "airgrab"]=Vet_3H_airgrab 
			sprites[90]=Vet_3H_attach_sticky_mine
			sprites[91]=Vet_3H_attach_sticky_mine //super version (to be changed)
			sprites[92]=Vet_3H_dig_placed
			sprites[93]=Vet_3H_dig_placed //super version (to be changed)
			sprites[69]=Vet_3H_dig_h  ////super version (to be changed)
			sprites[68]=Vet_3H_dig_h 
			sprites[66]=Vet_3H_dig_channel   ///super version (to be changed)
			sprites[67]=Vet_3H_dig_channel
			sprites[65]=Vet_3H_fall_parachute  ///super version (to be changed)
			sprites[64]=Vet_3H_fall_parachute
			sprites[62]=Vet_3H_forwardpunch
			sprites[63]=Vet_3H_forwardpunch //super version (to be changed)
			sprites[60]=Vet_3H_upwardpunch  ///super version (to be changed)
			sprites[61]=Vet_3H_upwardpunch
			sprites[? "dizzy_u"]=Vet_3H_dizzy  //super version
			sprites[? "dizzy"]=Vet_3H_dizzy
			sprites[? "light_attack_u"]=Vet_3H_uppercut  //super version
			sprites[? "light_attack"]=Vet_3H_uppercut
			sprites[? "dash_u"]=Vet_3H_charge    ////super version (to be changed) 
			sprites[? "dash"]=Vet_3H_charge
			sprites[14]=goldboi
			sprites[? "death_fall"]=P1_corpse
			sprites[? "idle"]=Vet_3H_idle_E
			sprites[? "run"]=Vet_3H_run
			sprites[? "jump"]=Vet_3H_jump
			sprites[? "air"]=Vet_3H_air 
			sprites[? "fall"]=Vet_3H_fall
			sprites[? "gpfall"]=Vet_3H_gpfall
			sprites[? "super_activate"]=Ooga_pal1_ult_actiavte
			sprites[? "gpfall_u"]=Vet_3H_gpfall  //super version
			sprites[? "run_u"]=Vet_3H_run    //super version
			sprites[? "idle_u"]=Vet_3H_idle_E //super version
			sprites[? "jump_u"]=Vet_3H_jump  //super version
			sprites[? "air_u"]=Vet_3H_air  //super version
			sprites[? "fall_u"]=Vet_3H_fall  //super version
		}
	}break;
    
	case "slinger":
	{
		if palette==0
		{
			supersparkle_sprite=P1_saiyanaura 
			sentinel_colour=c_purple    
			sprites[73]=Slinger_3H_airsunbolt  ///super version (to be changed)
			sprites[72]=Slinger_3H_airsunbolt
			sprites[71]=Slinger_3H_sunbolt  ///super version (to be changed)
			sprites[70]=Slinger_3H_sunbolt 
			sprites[? "rocketjump"]=Slinger_3H_rocketjump
			sprites[? "rocketjump_u"]=Slinger_3H_rocketjump
			sprites[? "rocketjump_charge"]=Slinger_3H_rocketjump_charge
			sprites[? "rocketjump_charge_u"]=Slinger_3H_rocketjump_charge  ///super version (to be changed)
			sprites[? "rocketjump_effect"]=Slinger_rjump_effect_spr
			sprites[? "gp_hit_ground_effect"]=groundpoundeffect
			sprites[? "recoiling_u"]=Slinger_3H_recoiling  ///super version (to be changed)
			sprites[? "recoiling"]=Slinger_3H_recoiling
			sprites[? "airgrab_u"]=Vet_3H_airgrab  ///super version (to be changed)
			sprites[? "airgrab"]=Vet_3H_airgrab  
			sprites[? "dizzy_u"]=Slinger_3H_dizzy  //super version
			sprites[? "dizzy"]=Slinger_3H_dizzy
			sprites[? "light_attack_u"]=Vet_3H_uppercut   ///super version
			sprites[? "light_attack"]=Vet_3H_uppercut
			sprites[? "dash_u"]=Slinger_3H_charge    ////super version (to be changed) 
			sprites[? "dash"]=Slinger_3H_charge
			sprites[14]=goldboi
			sprites[? "death_fall"]=P1_corpse
			sprites[? "idle"]=Slinger_3H_idle
			sprites[? "run"]=Slinger_3H_run
			sprites[? "jump"]=Slinger_3H_jump
			sprites[? "air"]=Slinger_3H_air 
			sprites[? "fall"]=Slinger_3H_fall
			sprites[? "gpfall"]=Slinger_3H_gpfall
			sprites[? "super_activate"]=Ooga_pal1_ult_actiavte
			sprites[? "gpfall_u"]=Slinger_3H_gpfall  //super version
			sprites[? "run_u"]=Slinger_3H_run  //super version
			sprites[? "idle_u"]=Slinger_3H_idle  //super version
			sprites[? "jump_u"]=Slinger_3H_jump  //super version
			sprites[? "air_u"]=Slinger_3H_air  //super version
			sprites[? "fall_u"]=Slinger_3H_fall      //super version     
		}
	} break;
	
	case "bait":
	{
		supersparkle_sprite=P1_saiyanaura 
		sentinel_colour=c_purple
		sprites[86]=Bait_3H_blinkjump_windup
		sprites[87]=Bait_3H_blinkjump_windup //super version (to be changed)
		sprites[84]=Bait_3H_spin
		sprites[83]=Bait_3H_use_teleport
		sprites[82]=Bait_3H_place_teleport
		sprites[80]=Bait_3H_heavypunch
		sprites[81]=Bait_3H_heavypunch   ///super version (to be changed)
		sprites[? "rocketjump"]=Bait_3H_rocketjump
		sprites[? "rocketjump_u"]=Bait_3H_rocketjump
		sprites[? "rocketjump_charge"]=Bait_3H_rocketjump_charge
		sprites[? "rocketjump_charge_u"]=Bait_3H_rocketjump_charge  ///super version (to be changed)
		sprites[? "rocketjump_effect"]=Bait_rjump_effect_spr
		sprites[? "gp_hit_ground_effect"]=groundpoundeffect
		sprites[? "recoiling_u"]=Bait_3H_recoiling  ///super version (to be changed)
		sprites[? "recoiling"]=Bait_3H_recoiling
		sprites[? "airgrab_u"]=Vet_3H_airgrab  ///super version (to be changed)
		sprites[? "airgrab"]=Vet_3H_airgrab  
		sprites[? "dizzy_u"]=Bait_3H_dizzy  //super version
		sprites[? "dizzy"]=Bait_3H_dizzy
		sprites[? "light_attack_u"]=Bait_3H_uppercut   ///super version
		sprites[? "light_attack"]=Bait_3H_uppercut
		sprites[? "dash_u"]=Bait_3H_dash    ////super version (to be changed) 
		sprites[? "dash"]=Bait_3H_dash
		sprites[14]=goldboi
		sprites[? "death_fall"]=P1_corpse
		sprites[? "idle"]=Bait_3H_idle
		sprites[? "run"]=Bait_3H_run
		sprites[? "jump"]=Bait_3H_jump
		sprites[? "air"]=Bait_3H_air 
		sprites[? "fall"]=Bait_3H_fall
		sprites[? "gpfall"]=Bait_3H_gpfall
		sprites[? "super_activate"]=Ooga_pal1_ult_actiavte
		sprites[? "gpfall_u"]=Bait_3H_gpfall  //super version
		sprites[? "run_u"]=Bait_3H_run_super_mode  //super version
		sprites[? "idle_u"]=Bait_3H_idle_super_mode  //super version
		sprites[? "jump_u"]=Bait_3H_jump  //super version
		sprites[? "air_u"]=Bait_3H_air  //super version
		sprites[? "fall_u"]=Bait_3H_fall      //super version          
	} break;
    
	default:
		show_error("unknown character ID, sprite decision fail",true)
    
}
