if uniques_teleport==1                                                                                    ///use teleport
{
	if instance_exists(uniques_my_teleport_id)  // if teleport exists
	{
		if !place_meeting(uniques_my_teleport_id.x,uniques_my_teleport_id.y,block)
		{
			if uniques_supergrab_teletrap_victim!=noone
			{
				//move anchor to teletrapped position if chained
				if uniques_supergrab_teletrap_victim.chained_debuff_counter>0
				{
					//update chained coordinates
					uniques_supergrab_teletrap_victim.chained_debuff_x_pos=uniques_my_teleport_id.x
					uniques_supergrab_teletrap_victim.chained_debuff_y_pos=uniques_my_teleport_id.y
					
					//destroy old chain effect
					with uniques_supergrab_teletrap_victim.chain_effect_id_to_delete
						instance_destroy()

					//create new chain effect
					with uniques_supergrab_teletrap_victim
						attack_bait_create_chain_effect()

					//set new chain effect position to teletrap position
					uniques_supergrab_teletrap_victim.chain_effect_id_to_delete.x=uniques_my_teleport_id.x
					uniques_supergrab_teletrap_victim.chain_effect_id_to_delete.y=uniques_my_teleport_id.y

				}
				
				var a;
				a=effect_aniend(bait_supergrab_teletrap_spr,0.2,-3)
				a.x=uniques_supergrab_teletrap_victim.x
				a.y=uniques_supergrab_teletrap_victim.y
				
				
				uniques_supergrab_teletrap_victim.x=uniques_my_teleport_id.x   ///send target to teleport position
				uniques_supergrab_teletrap_victim.y=uniques_my_teleport_id.y
			}
			else
			{	
				x=uniques_my_teleport_id.x   ///go to teleport position
				y=uniques_my_teleport_id.y
			}
			effect_create_above(ef_firework,x,y,2,c_aqua)
		}
		
		////delete teleport
		with uniques_my_teleport_id
			instance_destroy()
			
		attack_bait_reset_teleport()
	}
}