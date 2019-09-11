if sprite_index==sprites[? "jump"]
{
	sprite_index=sprites[? "air"]   ////air
	image_speed=FRAME_SPEED_SLOW
}
else if sprite_index==sprites[? "run"] || sprite_index==sprites[? "run_u"]
{
	image_index=running_startup_frames
}
else if sprite_index==sprites[? "jump_u"]    ///jump super
{
	sprite_index=sprites[? "air_u"]    ///air super
	image_speed=FRAME_SPEED_SLOW
}
else if sprite_index==sprites[? "airgrab"]  ///airgrab
{
	sprite_index=sprites[? "air"]   ////air
	image_speed=FRAME_SPEED_SLOW
}
else if sprite_index==sprites[? "airgrab_u"]    ///airgrab super
{
	sprite_index=sprites[? "air_u"]    ///air super
	 image_speed=FRAME_SPEED_SLOW
}
else if sprite_index==sprites[? "gpfall"] || sprite_index==sprites[? "gpfall_u"]  ///gp fall or gp fall super
{
	image_speed=FRAME_SPEED_FAST    ///loop last frames of gp animation
	image_index=image_number-2
}
else if sprite_index==sprites[? "rocketjump_charge"] || sprite_index==sprites[? "rocketjump_charge_u"]  ///rocket jump or rocket jump super
{
	if dash_rocket_jump==1
	{ 
		dash_rocket_jump_charge=3
		attack_rocket_jump()
	}
}
else if sprite_index==sprites[? "super_activate"]  ///super activate
{
	sprite_index=sprites[? "run_u"]    ///super running
}
else if sprite_index==sprites[? "dash"] || sprite_index==sprites[? "light_attack"]   ///dash
{
	hspd=0//(hspd/3)
	mild_slowed_counter=8
	player_set_idle()
}
else if sprite_index==sprites[? "uniques_airgrab_slam_down"] || sprite_index==sprites[? "uniques_airgrab_slam_down_u"]   //uga airgrab slam
{
	uniques_slam_airgrab_slam_lockdown=2
	sprite_index=sprites[? "uniques_airgrab_slam_down"]
	if super_mode
		sprite_index=sprites[? "uniques_airgrab_slam_down_u"]
	vspd=UNIQUES_SLAM_AIRGRAB_VSPD
	
	var target_P
	target_P=undefined
	if instance_exists(uniques_slam_airgrab_target) && uniques_slam_airgrab_target!=noone
	{
		if uniques_slam_airgrab_target.airgrab_mode=="being_airgrabbed"
		uniques_slam_airgrab_target.airgrab_mode="cannot_airgrab"
		target_P=uniques_slam_airgrab_target.P
	}
	with attack_create_hitbox(20,0,true,true,"uga_air_slam",uga_airgrab_slam_fake_hitbox,0.0002,99,0,UNIQUES_SLAM_AIRGRAB_VSPD)
	{
		for (var i=0;i<kouchou.MAX_PLAYER_COUNT;i++)
		{
			hit[i]=true
		}
		if target_P!=undefined
			hit[target_P]=false
	}
	uniques_slam_airgrab_target=noone
}
else if sprite_index==sprites[? "uniques_place_mine"]   ///vet place mine
{
	player_set_idle()
	var a;
	a=instance_create(x,y+5,mine)
	a.creator=a.id
	a.player_who_placed_mine=self.id
	mines_ammo-=1
}
else if sprite_index==sprites[? "uniques_place_sticky_mine"] || sprite_index==sprites[? "uniques_place_sticky_mine_u"] //vet sticky mine
{
	if uniques_sticky_mine_lockdown==1
	{
		uniques_sticky_mine_lockdown=0
		player_set_idle()
	}
}
else if sprite_index==sprites[? "uniques_dig_channel_u"] || sprite_index==sprites[? "uniques_dig_channel"]  ///vet dig
{
	if uniques_vet_digging==1
	{
		uniques_vet_digging=2
		sprite_index=sprites[? "uniques_dig"]
		if super_mode
			sprite_index=sprites[? "uniques_dig_u"]
	}
}
else if sprite_index==sprites[? "uniques_place_teleport"]  ///bait teleport place
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
else if sprite_index==sprites[? "uniques_use_teleport"]  ///bait teleport use
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
else if sprite_index==sprites[? "uniques_blinkjump_windup"] ||sprite_index==sprites[? "uniques_blinkjump_windup_u"]  ///bait blink gp attack
{ 
	effect_aniend(bait_blinkjump_effect,-1,0.2) 
	uniques_dashgpblinkattack_lockdown=0
	
	var skip=false;
	if uniques_baitchain_last_chained==noone 
		skip=true
	if !skip && !instance_exists(uniques_baitchain_last_chained)
		skip=true
	if !skip && !place_meeting(uniques_baitchain_last_chained.x,uniques_baitchain_last_chained.y-UNIQUES_DASHGPBLINKATTACK_START_HEIGHT,block)
	{
		var a;
		a=instance_create_depth(x,y,-1,proxy_bait_blink_gp_attack)
		a.creator=self.id
		a.targ_x=uniques_baitchain_last_chained.x
		a.targ_y=uniques_baitchain_last_chained.y-UNIQUES_DASHGPBLINKATTACK_START_HEIGHT
		
		var distance,dir;
		distance = point_distance(a.x,a.y,a.targ_x,a.targ_y)
		dir = point_direction(a.x,a.y,a.targ_x,a.targ_y)
		
		a.pos_x[3]=a.targ_x
		a.pos_y[3]=a.targ_y
		
		a.pos_x[1]=a.x+lengthdir_x(distance/3,dir)
		a.pos_y[1]=a.y+lengthdir_y(distance/3,dir)
		
		a.pos_x[2]=a.x+lengthdir_x(2*distance/3,dir)
		a.pos_y[2]=a.y+lengthdir_y(2*distance/3,dir)
		
		a.pos_x[0]=a.x
		a.pos_y[0]=a.y
		
		instance_deactivate_object(self)
	}
	
	player_set_idle()
}
else if sprite_index==sprites[? "rocketjump"] || sprite_index==sprites[? "rocketjump_u"]  ///rocket jump end
{
	if dash_rocket_jump==2
	{
		vspd/=1.5
		player_set_idle()
		dash_rocket_jump=3
		dash_rocket_top_collision_safety_on=false
	}
}
else if sprite_index==sprites[? "uniques_falconpunch"] || sprite_index==sprites[? "uniques_falconpunch_u"]  ///falc punch
{
	if fpunch_lockdown==3
	{
		fpunch_lockdown=0  
		player_set_idle()
	}
}
else if sprite_index==sprites[? "uniques_upwardpunch"] || sprite_index=sprites[? "uniques_upwardpunch_u"]    ///aa punch
{
	if uniques_aapunch_lockdown==3
	{
		uniques_aapunch_has_made_hitbox=false
		uniques_aapunch_has_made_hitbox2=false
		uniques_aapunch_lockdown=0  
		player_set_idle()
	}    
}
else if sprite_index=sprites[? "uniques_forwardpunch"] || sprite_index=sprites[? "uniques_forwardpunch_u"]    /// veteran chain forwardpunch
{
	if uniques_forwardpunch_lockdown==2
	{ 
		uniques_forwardpunch_lockdown=0
		uniques_forwardpunch_has_made_hitbox=false
		player_set_idle()  
	}
}
else if sprite_index==sprites[? "uniques_sunbolt"] || sprite_index==sprites[? "uniques_sunbolt_u"]  ///slinger sunblast
{
	if uniques_sunblast_lockdown==2
	{
		uniques_sunblast_lockdown=0
		player_set_idle()   
	}
}
else if sprite_index==sprites[? "uniques_airsunbolt_u"] || sprite_index==sprites[? "uniques_airsunbolt"]  ///slinger air sunbolt
{
	if uniques_airbolt_lockdown==2
	{
		uniques_airbolt_lockdown=0
		player_set_idle()
	}
}
else if sprite_index==sprites[? "uniques_heavyswing"] || sprite_index==sprites[? "uniques_heavyswing_u"]  ///bait shark attack heavy attack
{
	if uniques_sharkattack_lockdown==2
	{
		uniques_sharkattack_lockdown=0  
		player_set_idle()
	}
}
else if sprite_index==sprites[? "dash_u"] || sprite_index==sprites[? "light_attack_u"]   ///super dash or super push
{
	player_set_idle() 
}
else if sprite_index==sprites[? "uniques_dig_place_mine"] || sprite_index==sprites[? "uniques_dig_place_mine_u"]
{
	uniques_drill_mine_place_animation_lock=false
	sprite_index=sprites[? "uniques_dig"]
	if super_mode
		sprite_index=sprites[? "uniques_dig_u"]
}


