var attacker
if instance_exists(other.creator)
	attacker=other.creator
else
	attacker=noone


switch argument0
{
	case "ground pound":
	with attacker
	{
		if cangroundpound==2  ///if gping
		{
			if unique_ooga_gp_charges>0 && uniques_super_ooga_gp_enabled==true 
				attack_ooga_ultimate()
			cangroundpound=3
			var d;
			d=other.id
			with flower
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
	if stunned_groundpound>0
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
	case "veteranuppercut":
	if attacker!=noone
	{
		attacker.uniques_vet_la_target_counter=UNIQUES_VET_LA_TARGET_COUNTER_RESET_TIME
		attacker.uniques_vet_la_target=self.id
	}
	break;
	case "falconpunch" :
	with attacker
		move_that_adds_pocket()
	if stunned_groundpound>0
	{
		impact_debuff_counter=40
		//cripple_debuff_counter=120
		vspd-=1
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
	case "uga_air_slam":
		canbounce_counter=40
		show_debug_message("vspd="+string(vspd))
	break;
	case "slingeruppercut" :
	{
		if attacker!=noone
		{
			with attacker
				attack_slinger_enter_phase()
		}
	}   
	break;
	case "baitchain" :
	{
		if chained_debuff_counter>0
		{
			if  chain_effect_id_to_delete!=noone && instance_exists(chain_effect_id_to_delete)
			{
				with chain_effect_id_to_delete
					instance_destroy()
				chain_effect_id_to_delete=noone
			}
		}
		
		chained_debuff_counter=BAITCHAIN_CHAIN_TIME   //failsafe, reset to attackers chain_time if attacker exists
		chained_debuff_x_pos=x
		chained_debuff_y_pos=y
		uniques_baitchain_update_pos_counter=8  ///updates above positions in a few steps (feels better)
		
		var me;
		me=self.id
		chain_effect_id_to_delete=instance_create(x,y,ef_chain)
		chain_effect_id_to_delete.target=-1
		chain_effect_id_to_delete.tx=x
		chain_effect_id_to_delete.ty=y
		if instance_exists(me)
		{
			with chain_effect_id_to_delete
			{
				target=me
				tx=me.x
				ty=me.y
			}
		}
		if attacker!=noone
		{
			chained_debuff_counter=attacker.BAITCHAIN_CHAIN_TIME
			attacker.uniques_baitchain_last_chained_timer=attacker.BAITCHAIN_CHAIN_TIME
			attacker.uniques_baitchain_last_chained=self.id
		}
	} 
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
	case "sharkattack":
	case "sunblast":
	case "spinattack":
		with attacker
			move_that_adds_pocket()
	break;
}
