if uniques_teleport==1                                                                                    ///use teleport
{
	if instance_exists(uniques_my_teleport_id)  // if teleport exists
	{
		if !place_meeting(uniques_my_teleport_id.x,uniques_my_teleport_id.y,block)
		{
			if uniques_supergrab_teletrap_victim!=noone
			{			
				uniques_supergrab_teletrap_victim.x=uniques_my_teleport_id.x   ///go to teleport position
				uniques_supergrab_teletrap_victim.y=uniques_my_teleport_id.y
			}
			else
			{	
				x=uniques_my_teleport_id.x   ///go to teleport position
				y=uniques_my_teleport_id.y
			}
			effect_create_above(ef_firework,x,y,2,c_aqua)
		}
		with uniques_my_teleport_id        ////delete teleport
			instance_destroy()
		attack_bait_reset_teleport()
	}
}