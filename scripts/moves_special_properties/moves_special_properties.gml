switch argument0
{
	case "oogauppercut" :   ////ooga's
	if STUNNED2>0
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
	case "falconpunch" :
	if STUNNED2>0
	{
		impact_debuff_counter=40
		cripple_debuff_counter=120
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
	case "slingerjumpresetdash" :
	{
		if !groundcheck
		{
			other.creator.doublejump=1
			other.creator.doublejumptimer=DOUBLEJUMPTIME*3
			effect_aniend(spr_slinger_reset_jump,0.1,-2)
		}
	} break;
	case "slingeruppercut" :
	{
		with other.creator
		{
			if checkkey(lightbutton)
			{
			effect_create_above(ef_firework,x,y,c_green,2)
			}
		}
	}   break;
	case "baitchain" :
	{
		if chained_debuff_counter>0
		{
			if  chain_effect_id_to_delete!=noone
			{
				with chain_effect_id_to_delete
					instance_destroy()
				chain_effect_id_to_delete=noone
			}
		}
        
		chained_debuff_counter=150
		chained_debuff_x_pos=x
		chained_debuff_y_pos=y
		var me;
		me=self.id
		chain_effect_id_to_delete=instance_create(x,y,ef_chain)
		with chain_effect_id_to_delete
		{
			target=me
			tx=me.x
			ty=me.y
		}
	} break;
	case "sharkattack":
	{    ////when hit by sharkattack, move chain origin in direction of attack
		if chained_debuff_counter>0    ///debuff when etting hit by bait chaining attack
		{
			if chained_debuff_counter<100     ///prolongs chain timer a tad
				chained_debuff_counter=100
			with effect_aniend(bait_sharkattack_hit_effect,0.3,-1)
				y-=40
			var dx;
			dx=80
			if other.direction==180
				dx=-80
			chained_debuff_x_pos+=dx
			if  chain_effect_id_to_delete!=noone
			{
				with chain_effect_id_to_delete
					x+=dx
			}
			

		}
	}break;
}
