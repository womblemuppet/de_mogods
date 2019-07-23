/***************************************************
  sprites
  
  0-24(currently) shared
  40-49 death animations
  60-69 veteran uniques
  70-79 slinger uniques
 ***************************************************/

var sprites_index_max;
sprites_index_max=150
sprites[sprites_index_max]=mask_player
for (var i=0; i<sprites_index_max; i+=1)
{
	sprites[i]=mask_player
};
 
 
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
				sprites[27]=Ooga_gp_effect
				sprites[28]=Ooga_4H_rocketjump
				sprites[29]=Ooga_U_rocketjump
				sprites[30]=Ooga_4H_rocketjump_charge
				sprites[31]=Ooga_U_rocketjump_charge
				sprites[33]=Ooga_rjump_effect_spr
				sprites[42]=Ooga_death_by_acid
				sprites[41]=Ooga_death_by_zap
				sprites[40]=Ooga_death_by_ice
				sprites[26]=Ooga_4H_recoiling_super
				sprites[25]=Ooga_4H_recoiling
				sprites[24]=Ooga_4H_airgrab  ///super version (to be changed)
				sprites[23]=Ooga_4H_airgrab 
				sprites[22]=Ooga_4H_falconpunch  ///super version (to be changed)
				sprites[21]=Ooga_4H_falconpunch
				sprites[20]=Ooga_4H_dizzy   ///superversion (to be chnageD)
				sprites[19]=Ooga_4H_dizzy
				sprites[18]=Ooga_U_uppercut
				sprites[17]=Ooga_4H_uppercut
				sprites[16]=Ooga_U_charge 
				sprites[15]=Ooga_4H_charge
				sprites[14]=goldboi
				sprites[13]=P1_corpse
				sprites[0]=Ooga_4H_idle
				sprites[1]=Ooga_4H_run
				sprites[2]=Ooga_4H_jump
				sprites[3]=Ooga_4H_air 
				sprites[4]=Ooga_4H_fall
				sprites[5]=Ooga_4H_gpfall
				sprites[6]=Ooga_pal1_ult_actiavte
				sprites[7]=Ooga_U_gpfall
				sprites[8]=Ooga_U_run
				sprites[9]=Ooga_U_idle
				sprites[10]=Ooga_U_jump
				sprites[11]=Ooga_U_air
				sprites[12]=Ooga_U_fall
			}
		}
/*        else if palette==1
        {
            supersparkle_sprite=P1_saiyanaura  
            sentinel_colour=c_yellow  
                
            if H==3 || H==4 || H==5
            {
                sprites[42]=Ooga_death_by_acid
                sprites[41]=Ooga_death_by_zap
                sprites[40]=Ooga_death_by_ice
                sprites[26]=Ooga_3H_recoiling_super
                sprites[25]=Ooga_3H_recoiling
                sprites[24]=Ooga_3H_airgrab  ///super version (to be changed)
                sprites[23]=Ooga_3H_airgrab 
                sprites[22]=Ooga_3H_falconpunch  ///super version (to be changed)
                sprites[21]=Ooga_3H_falconpunch
                sprites[20]=P1_dizzy_ult
                sprites[19]=P1_dizzy
                sprites[18]=P1_push_ult
                sprites[17]=Ooga_H3_uppercut
                sprites[16]=P1_charge_ult 
                sprites[15]=Ooga_H3_charge
                sprites[14]=goldboi
                sprites[13]=P1_corpse
                sprites[0]=Ooga_3H_idle
                sprites[1]=Ooga_3H_run
                sprites[2]=Ooga_3H_jump
                sprites[3]=Ooga_3H_air 
                sprites[4]=Ooga_3H_fall
                sprites[5]=Ooga_H3_gpfall
                sprites[6]=P1_superactivate
                sprites[7]=P1_groundpound_super
                sprites[8]=P1_RunningR_super
                sprites[9]=P1_NeutralR_super
                sprites[10]=P1_jump_windup_super
                sprites[11]=P1_jump_freeze_super
                sprites[12]=P1_jump_fall_super
            }
        }*/
	} break;
    
	case "veteran":
	{
		if palette==0
		{
			supersparkle_sprite=P1_saiyanaura 
			sentinel_colour=c_purple     
			sprites[32]=Vet_3H_place_mine
			sprites[27]=groundpoundeffect
			sprites[28]=Vet_3H_rocketjump
			sprites[29]=Vet_3H_rocketjump   ///super version (to be changed)
			sprites[30]=Vet_3H_rocketjump_charge
			sprites[31]=Vet_3H_rocketjump_charge  ///super version (to be changed)
			sprites[33]=Vet_rjump_effect_spr
			sprites[26]=Vet_3H_recoiling  ///super version (to be changed)
			sprites[25]=Vet_3H_recoiling
			sprites[24]=Vet_3H_airgrab  ///super version (to be changed)
			sprites[23]=Vet_3H_airgrab 
			sprites[90]=Vet_3H_attach_sticky_mine
			sprites[91]=Vet_3H_attach_sticky_mine //super version (to be changed)
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
			sprites[20]=Vet_3H_dizzy  //super version
			sprites[19]=Vet_3H_dizzy
			sprites[18]=Vet_3H_uppercut  //super version
			sprites[17]=Vet_3H_uppercut
			sprites[16]=Vet_3H_charge    ////super version (to be changed) 
			sprites[15]=Vet_3H_charge
			sprites[14]=goldboi
			sprites[13]=P1_corpse
			sprites[0]=Vet_3H_idle_E
			sprites[1]=Vet_3H_run
			sprites[2]=Vet_3H_jump
			sprites[3]=Vet_3H_air 
			sprites[4]=Vet_3H_fall
			sprites[5]=Vet_3H_gpfall
			sprites[6]=Ooga_pal1_ult_actiavte
			sprites[7]=Vet_3H_gpfall  //super version
			sprites[8]=Vet_3H_run    //super version
			sprites[9]=Vet_3H_idle_E //super version
			sprites[10]=Vet_3H_jump  //super version
			sprites[11]=Vet_3H_air  //super version
			sprites[12]=Vet_3H_fall  //super version
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
			sprites[28]=Slinger_3H_rocketjump
			sprites[29]=Slinger_3H_rocketjump
			sprites[30]=Slinger_3H_rocketjump_charge
			sprites[31]=Slinger_3H_rocketjump_charge  ///super version (to be changed)
			sprites[33]=Slinger_rjump_effect_spr
			sprites[27]=groundpoundeffect
			sprites[26]=Slinger_3H_recoiling  ///super version (to be changed)
			sprites[25]=Slinger_3H_recoiling
			sprites[24]=Vet_3H_airgrab  ///super version (to be changed)
			sprites[23]=Vet_3H_airgrab  
			sprites[20]=Slinger_3H_dizzy  //super version
			sprites[19]=Slinger_3H_dizzy
			sprites[18]=Vet_3H_uppercut   ///super version
			sprites[17]=Vet_3H_uppercut
			sprites[16]=Slinger_3H_charge    ////super version (to be changed) 
			sprites[15]=Slinger_3H_charge
			sprites[14]=goldboi
			sprites[13]=P1_corpse
			sprites[0]=Slinger_3H_idle
			sprites[1]=Slinger_3H_run
			sprites[2]=Slinger_3H_jump
			sprites[3]=Slinger_3H_air 
			sprites[4]=Slinger_3H_fall
			sprites[5]=Slinger_3H_gpfall
			sprites[6]=Ooga_pal1_ult_actiavte
			sprites[7]=Slinger_3H_gpfall  //super version
			sprites[8]=Slinger_3H_run  //super version
			sprites[9]=Slinger_3H_idle  //super version
			sprites[10]=Slinger_3H_jump  //super version
			sprites[11]=Slinger_3H_air  //super version
			sprites[12]=Slinger_3H_fall      //super version     
		}
	} break;
	
	case "bait":
	{
		supersparkle_sprite=P1_saiyanaura 
		sentinel_colour=c_purple
		sprites[84]=Bait_3H_spin
		sprites[83]=Bait_3H_use_teleport
		sprites[82]=Bait_3H_place_teleport
		sprites[80]=Bait_3H_heavypunch
		sprites[81]=Bait_3H_heavypunch   ///super version (to be changed)
		sprites[28]=Bait_3H_rocketjump
		sprites[29]=Bait_3H_rocketjump
		sprites[30]=Bait_3H_rocketjump_charge
		sprites[31]=Bait_3H_rocketjump_charge  ///super version (to be changed)
		sprites[33]=Bait_rjump_effect_spr
		sprites[27]=groundpoundeffect
		sprites[26]=Bait_3H_recoiling  ///super version (to be changed)
		sprites[25]=Bait_3H_recoiling
		sprites[24]=Vet_3H_airgrab  ///super version (to be changed)
		sprites[23]=Vet_3H_airgrab  
		sprites[20]=Bait_3H_dizzy  //super version
		sprites[19]=Bait_3H_dizzy
		sprites[18]=Bait_3H_uppercut   ///super version
		sprites[17]=Bait_3H_uppercut
		sprites[16]=Bait_3H_dash    ////super version (to be changed) 
		sprites[15]=Bait_3H_dash
		sprites[14]=goldboi
		sprites[13]=P1_corpse
		sprites[0]=Bait_3H_idle
		sprites[1]=Bait_3H_run
		sprites[2]=Bait_3H_jump
		sprites[3]=Bait_3H_air 
		sprites[4]=Bait_3H_fall
		sprites[5]=Bait_3H_gpfall
		sprites[6]=Ooga_pal1_ult_actiavte
		sprites[7]=Bait_3H_gpfall  //super version
		sprites[8]=Bait_3H_run  //super version
		sprites[9]=Bait_3H_idle  //super version
		sprites[10]=Bait_3H_jump  //super version
		sprites[11]=Bait_3H_air  //super version
		sprites[12]=Bait_3H_fall      //super version          
	} break;
    
	default:
		show_error("unknown character ID, sprite decision fail",true)
    
}
