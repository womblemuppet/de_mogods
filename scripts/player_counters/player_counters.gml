////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/*  animations/timers/counters  */
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    

hothandimageindex+=0.25//*hothands
if hothandimageindex>HOTHANDIMAGENUMBER
	hothandimageindex=0

    
if dashcd>0
{
	dashcd-=1
	if dashcd==0
		dash_wallbreak_forgive=false
}
if stunned>0
{
	stunned-=1
}
if stunned_groundpound>0
{
	stunned_groundpound-=1
	if stunned_groundpound==0
	{
		if recoil_sprite_counter>0   ///[finaledit] could give this the groundcheck treatment and only check once
		{
			sprite_index=sprites[? "recoiling"]
			if super_mode
				sprite_index=sprites[? "recoiling_u"]
		}
		else
		{
			sprite_index=sprites[? "idle"]
			if super_mode
				sprite_index=sprites[? "idle_u"]
		}
	}
}
//else                                                   ////////////health blending
//{
//	//////HP   [finaledit]
//	if H==3
//	{
//		image_blend=c_white
//	}
//	if H==2
//	{
//		image_blend=make_colour_rgb(183, 245, 115)
//		if P>2
//			image_blend=make_colour_rgb(183, 245, 215)
//	}
//	if H==1
//	{
//		image_blend=make_colour_rgb(229, 172, 0)
//		if P>2
//			image_blend=make_colour_rgb(229, 172, 100)
//	}
//}

if ground_pound_freeze_counter>0
{
	ground_pound_freeze_counter-=1
	if ground_pound_freeze_counter==0
	{    
		attack_start_groundpound_descent(attacks[? "gp"])
	}
}

if push_other_attacks_timer>0
	push_other_attacks_timer-=1

if doublejumptimer>0
	doublejumptimer-=1
	
/// ult time ticker
if super_mode_time_remaining>0
{
	super_mode_time_remaining-=1
	if super_mode_time_remaining==0 ///ran out of ult time
	{
		player_end_super_mode()
	}
}
	
	
if rocket_jump_input_time_counter_from_jump>0
{
	rocket_jump_input_time_counter_from_jump-=1
	//show_debug_message("from jump = "+string(rocket_jump_input_time_counter_from_jump))
}

if rocket_jump_input_time_counter_from_dash>0
{
	rocket_jump_input_time_counter_from_dash-=1
	//show_debug_message("from dash = "+string(rocket_jump_input_time_counter_from_dash))
}


if dash_attacks_allowed_counter>0
{
	//effect_create_above(ef_firework,x,y-20,0,c_red)
	dash_attacks_allowed_counter-=1
}

if recoil_sprite_counter>0                                           //recoil sprite end check
{
	recoil_sprite_counter-=1
    
	if recoil_sprite_counter==0
	{
		var pass;
		pass=false
		for (var i=0; i<ds_list_size(recoiling_sprites); i+=1)
		{
			if ds_map_find_value(sprites,recoiling_sprites[| i])==sprite_index
			{
				pass=true
				break;
			}
		};
		if pass
		{  
			player_set_idle()
		}
	}
}
if cripple_debuff_counter>0
{
	cripple_debuff_counter-=1
	if (cripple_debuff_counter mod 10) == 0
		effect_aniend(cripple_debuff_effect,1.5,-3)
}
if impact_debuff_counter>0
{
	impact_debuff_counter-=1
	effect_aniend(impact_debuff_effect,0.25,0)
}

if uniques_fpunch_lockdown==1
{
	uniques_fpunch_charge+=1
}

if uniques_spinner_attack_lockdown==1
{
	uniques_spinner_attack_charge+=1
}

if uniques_fpunch_cd_counter>0
{
	uniques_fpunch_cd_counter-=1
}
if uniques_vet_la_target_counter>0
{
	uniques_vet_la_target_counter-=1
	if uniques_vet_la_target_counter==0
	{
		uniques_vet_la_target=noone
	}
}
if uniques_sunblast_cd_counter>0
{
	uniques_sunblast_cd_counter-=1
}
if mild_slowed_counter>0
{
	mild_slowed_counter-=1
	if slowed_show_trail
		effect_aniend(slow_debuff_effect,0.25,-3)
}
if brutal_slowed_counter>0
{
	brutal_slowed_counter-=1
	if slowed_show_trail
		effect_aniend(mightyannoying_slow_debuff_effect,0.25,-3)    
}
if canbounce_counter>0
{
	canbounce_counter-=1
	show_debug_message(string(canbounce_counter)+" vspd="+string(vspd))
	effect_aniend(bounce_debuff_effect,0.15,0)
}
if uniques_parachute_minimum_time_counter>0
{
	uniques_parachute_minimum_time_counter-=1
}

if chained_debuff_counter>0
{
	chained_debuff_counter-=1
	if chained_debuff_counter==0
	{
		with chain_effect_id_to_delete
			instance_destroy()
		chain_effect_id_to_delete=noone
		hspd=0
		vspd=0
		effect_create_above(ef_firework,chained_debuff_x_pos,chained_debuff_y_pos,1,c_lime)
	}
}
if uniques_baitchain_last_chained_timer>0
{
	uniques_baitchain_last_chained_timer-=1
	if uniques_baitchain_last_chained_timer==0
		uniques_baitchain_last_chained=noone
}

if uniques_baitchain_update_pos_counter>0
{
	uniques_baitchain_update_pos_counter-=1
	//if uniques_baitchain_update_pos_counter==0
	//{
		chained_debuff_x_pos=x
		chained_debuff_y_pos=y	
		if instance_exists(chain_effect_id_to_delete)
		{
			chain_effect_id_to_delete.x=x
			chain_effect_id_to_delete.y=y
		}
	//}
}

if uniques_phase_counter>0
{
	uniques_phase_counter-=1
	if uniques_phase_counter==0
	{
		attack_slinger_phase_cancelled()
	}
}

if uniques_phase_landing_attack_disable_counter>0
	uniques_phase_landing_attack_disable_counter-=1
if float_counter>0
	float_counter-=1

if isteps>0
	isteps-=1
	
if immune_counter>0
	immune_counter-=1
	
if armouredsteps>0
	armouredsteps-=1
	

