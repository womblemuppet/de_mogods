if sprite_index==sprites[2]  ///jump
{
	sprite_index=sprites[3]   ////air
	image_speed=FRAME_SPEED_SLOW
}
else if sprite_index==sprites[1] || sprite_index==sprites[8]
{
	image_index=running_startup_frames
}
else if sprite_index==sprites[10]    ///jump super
{
	sprite_index=sprites[11]    ///air super
	image_speed=FRAME_SPEED_SLOW
}
else if sprite_index==sprites[23]  ///airgrab
{
	sprite_index=sprites[3]   ////air
	image_speed=FRAME_SPEED_SLOW
}
else if sprite_index==sprites[24]    ///airgrab super
{
	sprite_index=sprites[11]    ///air super
	 image_speed=FRAME_SPEED_SLOW
}
else if sprite_index==sprites[5] || sprite_index==sprites[7]  ///gp fall or gp fall super
{
	image_speed=FRAME_SPEED_FAST    ///loop last frames of gp animation
	image_index=image_number-2
}
else if sprite_index==sprites[30] || sprite_index==sprites[31]  ///angel charge or angel charge super
{
	image_speed=FRAME_SPEED_FAST    ///loop last frames of angel charge animation
	image_index=image_number-2
}
else if sprite_index==sprites[6]  ///super activate
{
	sprite_index=sprites[8]    ///super running
}
else if sprite_index==sprites[15] || sprite_index==sprites[17]   ///dash or push
{
	player_set_idle()
}
else if sprite_index==sprites[32]   ///vet place mine
{
	player_set_idle()
	var a;
	a=instance_create(x,y-10,mine)
	a.creator=self.id
	mines_ammo-=1
}
else if sprite_index==sprites[82]  ///bait teleport place
{
	player_set_idle()
	if uniques_teleport==0 		////create teleport if there isn't one
	{
		uniques_teleport=1
		uniques_my_teleport_id=instance_create(x,y-10,teleport)
		uniques_my_teleport_id.creator=self.id
		effect_create_above(ef_firework,x,y,2,c_red)
	}
}
else if sprite_index==sprites[83]  ///bait teleport use
{
	player_set_idle()

	if uniques_teleport==1                                                                                    ///use teleport
	{
		if instance_exists(uniques_my_teleport_id)  // if teleport exists
		{
			if !place_meeting(uniques_my_teleport_id.x,uniques_my_teleport_id.y,block)
			{
				x=uniques_my_teleport_id.x   ///go to teleport position
				y=uniques_my_teleport_id.y
				effect_create_above(ef_firework,x,y,2,c_aqua)
			}
			with uniques_my_teleport_id        ////delete teleport
				instance_destroy()
			uniques_my_teleport_id=-4
			uniques_teleport=0
		}
	}	
	
}
else if sprite_index==sprites[28] || sprite_index==sprites[29]  ///angel jump
{
	if dash_angel_jump==2
	{
		player_set_idle()
		dash_angel_jump=3
	}
}
else if sprite_index==sprites[21] || sprite_index==sprites[22]  ///falc punch
{
	if fpunch_lockdown==3
	{
		fpunch_lockdown=0  
		player_set_idle()
	}
}
else if sprite_index==sprites[60] || sprite_index=sprites[61]    ///aa punch
{
	if uniques_aapunch_lockdown==3
	{
		uniques_aapunch_has_made_hitbox=false
		uniques_aapunch_has_made_hitbox2=false
		uniques_aapunch_lockdown=0  
		player_set_idle()
	}    
}
else if sprite_index=sprites[62] || sprite_index=sprites[63]    /// veteran chain forwardpunch
{
	if uniques_forwardpunch_lockdown==2
	{ 
		uniques_forwardpunch_lockdown=0
		uniques_forwardpunch_has_made_hitbox=false
		player_set_idle()  
	}
}
else if sprite_index==sprites[70] || sprite_index==sprites[71]  ///slinger sunblast
{
	if uniques_sunblast_lockdown==2
	{
		uniques_sunblast_lockdown=0
		player_set_idle()   
	}
}
else if sprite_index==sprites[80] || sprite_index==sprites[81]  ///bait shark attack heavy attack
{
	if uniques_sharkattack_lockdown==2
	{
		uniques_sharkattack_lockdown=0  
		player_set_idle()
	}
}
else if sprite_index==sprites[16] || sprite_index==sprites[18]   ///super dash or super push
{
	player_set_idle() 
}


