if uniques_teleport==1                                                                                    ///use teleport
{
	if instance_exists(uniques_my_teleport_id)  // if teleport exists
	{
		if !place_meeting(uniques_my_teleport_id.x,uniques_my_teleport_id.y,block)
		{
			if uniques_supergrab_teletrap_victim!=noone
			{		
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