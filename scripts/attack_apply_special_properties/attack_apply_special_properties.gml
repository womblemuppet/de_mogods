var attacker
if instance_exists(other.creator)
	attacker=other.creator
else
	attacker=noone

var incoming_attack_name;
incoming_attack_name=argument0

switch incoming_attack_name
{
	case "ground pound with phase":
	case "ground pound":
	with attacker
	{
		if cangroundpound==2  ///if gping
		{
			cangroundpound=3
			var d;
			d=other.id
			with pineapple
			{
				if owner==d
				{
					cooldown=25
					samepersoncooldown=70
					owner=-1
					vspd=-24
					y-=4
					timer=TIMERSTARTNUMBER
					shake=0
					sprite_index=pineapple_fall
				}
			}
    
			vspd=-2.5
			if image_xscale==1
				hspd=4
			if image_xscale==-1
				hspd=-4
		}
		attack_clear_groundpound_current_hitbox_object()
	}
	
	player_get_gp_stunned(other.stunamount)
	
	break;
	case "oogauppercut" :   ////ooga's
	if player_is_stunned()
	{
		impact_debuff_counter=40
		vspd-=6
		repeat(5)
		{
			with effect_aniend(spr_gp_combo_uppercut,0.2,-2)
			{
				vspeed=-8
				hspeed=-2+random(4)
				gravity=0.2
			}
		}
	}  
	break;
	case "uga_gp_ult_shockwave":
		player_get_gp_stunned(other.stunamount)
	break;
	case "veteran_kamikaze":
	if attacker!=noone
		attacker.uniques_vet_kamikaze_victim=self.id
		
	break;
	case "falconpunch" :
	if player_is_stunned()
	{
		canbounce_counter=40
		impact_debuff_counter=40
		repeat(5)
		{
			with effect_aniend(spr_gp_combo_fpunch,0.2,-2)
			{
				vspeed=-8
				hspeed=-2+random(4)
				gravity=0.2
			}
		}
	}
	else
	{
		canbounce_counter=40
	} 
	break;
	case "baitchain" :
	{
		//delete old chain effect
		if chained_debuff_counter>0
		{
			if  chain_effect_id_to_delete!=noone && instance_exists(chain_effect_id_to_delete)
			{
				with chain_effect_id_to_delete
					instance_destroy()
				chain_effect_id_to_delete=noone
			}
		}
		
		chained_debuff_counter=BAITCHAIN_CHAIN_TIME   //(failsafe for if attacker doesn't exist)
		chained_debuff_x_pos=x
		chained_debuff_y_pos=y
		uniques_baitchain_update_pos_counter=8  ///updates above positions in a few steps (feels better)
		
		attack_bait_create_chain_effect()
		
		if attacker!=noone
		{
			chained_debuff_counter=attacker.BAITCHAIN_CHAIN_TIME
			attacker.uniques_baitchain_last_chained_timer=attacker.BAITCHAIN_CHAIN_TIME
			attacker.uniques_baitchain_last_chained=self.id
		}
	} 
	break;
	case "forwardpunch":
		impact_debuff_counter=40
	break;
	case "sunblast":
		impact_debuff_counter=40
	break;
	case "whirlwind" :
	{
		if attacker!=noone
		{
			with other.creator
			{
				uniques_whirlwind_active=false
				player_flush_lockdowns()
			}
		}
	} 
	break;
	case "mineexplosion_big":
		if !place_meeting(x,y-1,block)
			y-=1
		canbounce_counter=25
	break;
	case "supergrab":
	attacker.uniques_supergrab_target_x=x
	attacker.uniques_supergrab_target_y=y
	attacker.uniques_supergrab_teletrap_victim=self.id
	with attacker
	{
		uniques_supergrab_teletrap_counter=UNIQUES_SUPERGRAB_TELETRAP_TIME
		if button_scrape[? superbutton]
			uniques_supergrab_pull_counter=UNIQUES_SUPERGRAB_PULL_TIME
	}
	break;
}



//Phase stance
switch incoming_attack_name
{
	case "ground pound with phase":
	case "sunbolt":
	case "sunblast":
	case "uniques_superblast":
	case "slingeruppercut" :
	{
		if attacker!=noone
		{
			var me;
			me=self.id
			with attacker
				attack_slinger_enter_phase(me)
		}
	}   
	break;	
}