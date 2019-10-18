///////////////////////////////////////////////
/*step event///////////////////////////////////
*//////////////////////////////////////////////

if !aizen.debug
{
	for (var i = 0; i < USABLE_KEY_NAMES_SIZE; i++)
	{
		ds_map_set(button_scrape,USABLE_KEY_NAMES[i],checkkey(USABLE_KEY_NAMES[i]))
		ds_map_set(button_scrape_pushed,USABLE_KEY_NAMES[i],checkkey_pushed(USABLE_KEY_NAMES[i]))
		ds_map_set(button_scrape_released,USABLE_KEY_NAMES[i],checkkey_released(USABLE_KEY_NAMES[i]))
	}
}

player_vertical_bounce_check()
playerintersectioncheck=instance_place(x,y,player)
edgeofroomcheck=false

//////////////////////////////////////////     groundcheck

groundcheck=instance_place(x,y+1,block) 


if groundcheck!=noone
{
	if groundcheck.object_index==turret_block
	{
		var me,mycol;
		me=self.id
		mycol=sentinel_colour
		if me!=instance_place(x,y+1,turret_block).owner
		{
			with instance_place(x,y+1,turret_block)
			{
				owner=me
				alarm[0]=TAKEOVERTIME
				sprite_index=block_turret
				image_blend=mycol
				alarm[1]=UPGRADETIME
			}
			with sentinel
			{
				effect_create_above(ef_firework,x,y,0,c_red)
				instance_destroy()
			}
		}
	}
	else if groundcheck.object_index==weaksand
	{
		with instance_place(x,y+1,weaksand)
		{
			if dying==false
			{
				dying=true
				sprite_index=weaksand_sprite_die
				image_speed=0.1
				image_index=0
			}
		}
	}
}
else ///( if groundcheck==noone)
{
	dash_has_lifted_off_ground=true
}


player_emitters()
player_counters()


///////////////////////////////////////////////////////////////////////////////       (during airgrab throw && the throw event itself)                    AIRGRAB THROW EVENT
if airgrab_mode=="is_grabbing" && airgrab_decidedir_time>0
{
	if instance_exists(airgrab_target) && airgrab_target!=noone    /// position grabbed target infront of character
	{
		//if uniques_slam_airgrab_slam_enabled && uniques_slam_airgrab_slam_lockdown==0 && checkkey(dashbutton) && checkkey(downbutton)
		//{///UGA unique airgrab slam
		//	uniques_slam_airgrab_slam_lockdown=1
		//	sprite_index=sprites[? "uniques_airgrab_slam_down"]
		//	if super_mode
		//		sprite_index=sprites[? "uniques_airgrab_slam_down_u"]
		//	image_index=0
		//	image_speed=0.2
		//	uniques_slam_airgrab_target=airgrab_target
		//	uniques_slam_airgrab_target.x=x
		//	uniques_slam_airgrab_target.y=y
			
		//	with airgrab_target
		//	{
		//		vspd=0
		//		hspd=0
		//	}
				
		//	airgrab_decidedir_time=0
		//	airgrab_target=noone
			
		//}
		
		
		var tx,ty,steps_to_try_move;
		steps_to_try_move=8
		if right
			tx=x+12
		else
			tx=x-12
		ty=y-5
        
		with airgrab_target
		{
			repeat(steps_to_try_move)
			{
				if x>tx
				{
					if !place_meeting(x-1,y,block)
						x-=1
					else
					break;
				}
				else if x<tx
				{
					if !place_meeting(x+1,y,block)
						x+=1
					else
					break;
				}
				if y>ty
				{
					if !place_meeting(x,y-1,block)
						y-=1
					else
					break;
				}
				else if y<ty
				{
					if !place_meeting(x,y+1,block)
						y+=1
					else
					break;
				}
			}
		}
	}
    
	airgrab_decidedir_time-=1
	if airgrab_decidedir_time==1    ////airgrab throw event and damage
	{
		switch attacks[? "air grab effect"]
		{
			case "standard_airgrab_effect":
			if instance_exists(airgrab_target) && airgrab_target!=noone   ///if airgrab target exists, apply throw
			{
				var throw_direction,bounce;
				bounce=0
				
				////decide throw direction right left or down (up=use 'right' variable)
				aim_octilinear()
				if octdir==0 || octdir ==315 || octdir ==45
					throw_direction=0
				else if octdir==180 || octdir==225 || octdir ==135
					throw_direction=180
				else if octdir==270
				{
					throw_direction=270
					if sprite_index!=sprites[? "airslam"] && sprite_index!=sprites[? "airslam_u"]
						image_index=0
					sprite_index=sprites[? "airslam"]
					if super_mode
						sprite_index=sprites[? "airslam_u"]
				}
				else
				{
					if right
						throw_direction=0
					else
						throw_direction=180
				}
				
				cc_land_hit(self.id,airgrab_target)

				var at;
				at=AIRGRAB_STUN_TIME;

				with airgrab_target
				{
					player_flush_lockdowns()
					canbounce_counter=at
					stunned_groundpound=at
					airgrab_mode="cannot_airgrab"
					
					vspd=18
					if throw_direction==0
						hspd=7.5
					else if throw_direction==180
						hspd=-7.5
					else if throw_direction==270
					{
						airgrab_slam_on=true
						canbounce_counter=40
						vspd=24
					}
					
						
					
					float_counter=10
					
					if player_is_hittable("standard_airgrab_effect")
					{
						hothands+=1                         //// ONE HH DAMAGE
						player_has_taken_hh_damage()
						
					}
				}
				hothands=0                              //// RESETS THROWERS HH
			}
			
			airgrab_mode="cannot_airgrab"
			airgrab_target=noone
			vspd=-1                                                                 break;
			case -1:
			/*nandemonai*/                                                          break;
			default:
			show_error("bopopopo, unknown air throw effect attack id",true)
		}
	}
}


       
if groundcheck!=noone      ///[finaledit] combine this check with one below?
	ltt=LOONEYTUNE_TIME
else if ltt>-2
	ltt-=1
    


    
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/*  gravity && landing/ceiling collision    +    idle sprite setting  */
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////    

player_add_gravity()

if groundcheck!=noone && (dash_rocket_jump==3 || dash_rocket_jump==0) /// downward block collision  (don't count as landed if launching rocket jump)
{
	airgrab_mode="can_airgrab"   ///reset airgrab antispam penalty
	airgrab_slam_on=false

	if uniques_whirlwind_active
	{
		isteps+=1
		attack_create_hitbox(30,1,true,true,"whirlwind",spr_whirlwind_hitbox,1,99,4,5)
		
		if right
			hspd=UNIQUES_WHIRLWIND_SPEED
		else
			hspd=-UNIQUES_WHIRLWIND_SPEED
	}

	if before_prone_falling_lockdown
	{
		player_set_prone()
		before_prone_falling_lockdown=false
	}

	if cangroundpound==2   //////////GP HITS GROUND EFFECT EVENT
	{
		effect_aniend(sprites[? "gp_hit_ground_effect"],0.4,-2)
		
		var exception;
		exception=false
		
		if !exception
		{
			if disable_next_groundpound_effect
				disable_next_groundpound_effect=false
			else
			{
				switch attacks[? "gp_hit_ground_effect"]
				{
					case 0:
					//nandemonai
					break;
					case "bait_whirlwind":
					image_index=0
					image_speed=FRAME_SPEED_FAST
					sprite_index=sprites[? "uniques_whirlwind"]
					uniques_whirlwind_active=true
				}
			}
		}
		
		var a;
		a=instance_create(x,y,bop_hitbox)
		a.creator=self.id

		//delete groundpound hitbox
		attack_clear_groundpound_current_hitbox_object()
	}

	if jumped                            ////////////////////after landing from a jump , slow the player for a bit
	{
		if cangroundpound!=0  
		{
			mild_slowed_counter=0
			brutal_slowed_counter=7
		}
	}
	
	//////////////////////////////////////////////////////////////reset jumping/air variables
	cangroundpound=0
	dash_rocket_jump=0
	jumped=false
	vspd=0
	doublejump=0
	dash_rocket_top_collision_safety_on=false
	
	////////////////////////////////////////////////////////////jump vibration mask
	if groundcheck!=groundcheck_prev
		instance_create(x,y,jump_vibration)
	
	///////////////////////////////////////////////////////////vet parachute turn off
	if uniques_parachute>0
	{
		uniques_parachute=0 
		if sprite_index==sprites[? "uniques_parachute"] || sprite_index==sprites[? "uniques_parachute_u"]
		{
			sprite_index=sprites[? "fall"]  //////////////fall sprite
			if super_mode
				sprite_index=sprites[? "fall_u"] /////////fall super sprite
		}
	}
    
	////////////////////////////////////////////////////////if falling sprite, set sprite back to idle
	if sprite_index==sprites[? "fall"]   ///////////////////fall sprite
	{
		sprite_index=sprites[? "idle"]
		if recoil_sprite_counter>0
		{
			sprite_index=sprites[? "recoiling"]
		}
	}
	
	if sprite_index==sprites[? "fall_u"]  //////////////////fall super sprite
	{
		sprite_index=sprites[? "idle_u"]   /////////////////idle super sprite
		if recoil_sprite_counter>0
		{
			sprite_index=sprites[? "recoiling_u"]
		}
	}
}

player_block_above_check()


//set to idle sprite if on ground and not pushing left or right, and not in important animation 
//(WILL ONLY CHANGE IF CURRENT SPRITE IS IN LIST)
if !button_scrape[? leftbutton] && !button_scrape[? rightbutton] && groundcheck!=noone
{
	var pass;
	pass=false
	for (var i=0; i<ds_list_size(sprites_below_idle_priority); i+=1)
	{
		if ds_map_find_value(sprites,sprites_below_idle_priority[| i])==sprite_index
		{
			pass=true
			break;
		}
	};
        
	if pass
	{
		if recoil_sprite_counter>0
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
		image_speed=FRAME_SPEED_NORMAL
	}
}


////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/*  key pressed and abilities */
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


if button_scrape[? lightbutton] && button_scrape[? heavybutton]                                            /////// pocket event
{
	pocket_light_heavy_held_counter+=1
	if pocket_light_heavy_held_counter>2
	{
		if !player_has_no_pockets()
		{
			player_use_pocket()
		}
	}

}

//if pocket_light_heavy_held_counter>0    //////pocket keys release event
{   ///checks counter first for optimisation
	if button_scrape_released[? lightbutton] || button_scrape_released[? heavybutton] || button_scrape[? leftbutton] || button_scrape[? rightbutton] || button_scrape[? upbutton] 
	{
		pocket_light_heavy_held_counter=0
	}
}

if can_activate_super_mode==false && (  (button_scrape_released[? leftbutton] && button_scrape[? rightbutton]) || (button_scrape_released[? rightbutton] && button_scrape[? leftbutton])  )
	can_activate_super_mode=true


if button_scrape_pushed[? superbutton] && player_may_attack()   ////super attack event super event
{
	switch attacks[? "super attack"]
	{
		case "uga_supersmash":
		uniques_supersmash_lockdown=1
		uniques_supersmash_has_made_hitbox=false
		image_speed=FRAME_SPEED_FAST
		sprite_index=sprites[? "uniques_supersmash"]
		image_index=0
		break;
		
		case "uniques_superblast":

		//// sets slinger to be a minimum height above the ground ////////////////////////////////////////
		var STEP_DISTANCE,NUMBER_OF_STEPS;
		STEP_DISTANCE=35
		NUMBER_OF_STEPS=5
			
		for (var steps_from_ground = 0; steps_from_ground < NUMBER_OF_STEPS;steps_from_ground++)
		{
			if place_meeting(x,y+steps_from_ground*STEP_DISTANCE,block)
				break;
		}
			
		for (var i = 0; i < NUMBER_OF_STEPS - steps_from_ground; i++)
		{
			if !place_meeting(x,y-STEP_DISTANCE,block)
			{
				effect_aniend(superblast_jump_up_trail_effect_spr,0.2,-1)
				y-=STEP_DISTANCE
			}
		}
		////////////////////////////////////////////////////////////////////////////////////////////////////
		
		hspd=0
		vspd=0
		float_counter=15
		
		image_speed=FRAME_SPEED_FAST
		sprite_index=sprites[? "uniques_superblast"]
		image_index=0
		uniques_slinger_superblast_lockdown=1
		uniques_slinger_superblast_has_made_hitbox=false  //[finaledit] all step attack starts should include hitbox var reset
		break;
		
		case "vet_kamikaze":
		if (uniques_vet_kamikaze_lockdown!=0) break;
		if groundcheck!=noone break;
		
		uniques_vet_kamikaze_victim=noone
		uniques_vet_kamikaze_number_of_mines=0
		uniques_vet_kamikaze_lockdown=1
		image_index=0
		image_speed=FRAME_SPEED_NORMAL
		sprite_index=Vet_3H_super_charge
		break;
	}
}



if button_scrape_pushed[? lightbutton]  && groundcheck!=noone && player_may_attack() && pocket_light_heavy_held_counter<1  ////light attack
{
	var exception;
	exception=false
    
    
	if holding_a_crab     ////throw crab
	{
		exception=true
		player_throw_crab()
	}  

	if !exception && holding_a_crab==false     ///pick up crab
	{
		if distance_to_object(instance_nearest(x,y,crab))<30
		{
			exception=true
			effect_create_above(ef_firework,x,y-50,1,c_gray)
			var b;
			b=instance_nearest(x,y,crab)
			if b.owner==-1
			{ ////tame crab
				b.owner=self.id
				holding_a_crab=true
				crab_being_held=b
			}
		}
	}
	
	//if !exception && uniques_vet_chain_counter>0    //////vet LA => LA  forwardpunch chain
	//{                 ///////////   kept for chain reference if ever needed
	//	exception=true
	//	uniques_forwardpunch_has_made_hitbox=false
	//	uniques_forwardpunch_lockdown=1
	//	uniques_forwardpunch_feet_counter=0
	//	uniques_vet_chain_counter=-1
		
	//	image_speed=FRAME_SPEED_NORMAL
	//	sprite_index=sprites[? "uniques_forwardpunch"]
	//	if super_mode
	//		sprite_index=sprites[? "uniques_forwardpunch_u"]
	//	image_index=0
	//}
    

    
    
	if !exception && canpush
	{   
		var spawn_normal_uc_hitbox,uc_hitbox_shape,la_attack_name,extrahkb;
		spawn_normal_uc_hitbox=false
		la_attack_name="error"
		extrahkb=0
        
		switch attacks[? "light attack"]
		{
			case "uga_uppercut":
			la_attack_name="oogauppercut"
			spawn_normal_uc_hitbox=true
			uc_hitbox_shape=bammeroo 
			extrahkb=3 break;
            
			case "vet_uppercut":
			la_attack_name="veteranuppercut"
			spawn_normal_uc_hitbox=true
			uc_hitbox_shape=bammeroo break;
            
			case "slinger_uppercut":
			la_attack_name="slingeruppercut"
			spawn_normal_uc_hitbox=true
			uc_hitbox_shape=bammeroo break;
            
			case "bait_chaining_uppercut":
			la_attack_name="baitchain"
			spawn_normal_uc_hitbox=true
			uc_hitbox_shape=bammeroo break;
            
			case -1:            
			/*nandemonai*/        break;
            
			default:
			show_error("boop , unknown light attack called",true)
		}
        
		if spawn_normal_uc_hitbox
		{
			if la_attack_name=="error"
				show_error("invalid attack name recieved",true)
			canpush=false
			push_other_attacks_timer=PUSH_OTHER_ATTACKS_TIME
			alarm[1]=PUSH_COOLDOWN   
			sprite_index=sprites[? "light_attack"]
			if super_mode
				sprite_index=sprites[? "light_attack_u"]
			image_index=0
			image_speed=FRAME_SPEED_NORMAL

			attack_create_hitbox(30,1,true,true,la_attack_name,uc_hitbox_shape,1,99,10+extrahkb,11)
		}
	}
}

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// heavy attack

if button_scrape_pushed[? heavybutton]  && player_may_attack() && uniques_fpunch_cd_counter<1 && groundcheck!=noone   && pocket_light_heavy_held_counter<1  ///heavy attack button press
{
	var exception;
	exception=false
    
	if holding_a_crab    ////throw crab
	{ 
		exception=true
		player_throw_crab()
	}
	
	if !exception && uniques_sticky_mine_enabled && uniques_vet_la_target_counter>0 && mines_ammo>0   ///// sticky mine
	{
		if uniques_vet_la_target!=noone && instance_exists(uniques_vet_la_target)
		{
			image_speed=FRAME_SPEED_SLOW
			image_index=0
			sprite_index=sprites[? "uniques_place_sticky_mine"]
			if super_mode
				sprite_index=sprites[? "uniques_place_sticky_mine_u"]
			uniques_sticky_mine_lockdown=1
			var a;
			a=instance_create_depth(x,y,-1,ef_connector)
			a.targ1=self.id
			a.targ2=uniques_vet_la_target
			a.sprite_index=vet_3H_sticky_mine_connect_effect
			a.image_speed=FRAME_SPEED_NORMAL
		
			mines_ammo-=1
			a=instance_create_depth(uniques_vet_la_target.x,uniques_vet_la_target.y,-2,stickymine)
			a.creator=self.id
			a.targ=uniques_vet_la_target
			a.right=right
			a.scale=1
			exception=true
		}
	}
	
	if !exception
	{
		switch attacks[? "heavy attack"]
		{
			case "uga_falconpunch":
			image_speed=FRAME_SPEED_FAST
			sprite_index=sprites[? "uniques_falconpunch"]
			if super_mode
				sprite_index=sprites[? "uniques_falconpunch_u"]
			image_index=0
			uniques_fpunch_lockdown=1
			uniques_fpunch_cd_counter=UNIQUES_FPUNCH_COOLDOWN
			uniques_fpunch_feet_counter=0
			uniques_fpunch_has_made_hitbox=false
			break;
            
			case "vet_armspin":
			image_speed=FRAME_SPEED_FAST
			sprite_index=sprites[? "uniques_spinattack"]
			if super_mode
				sprite_index=sprites[? "uniques_spinattack_u"]
			image_index=0
			uniques_spinner_attack_lockdown=1
			break;
               
			case "slinger_sunblast":
			image_index=0
			image_speed=FRAME_SPEED_NORMAL
			sprite_index=sprites[? "uniques_sunbolt"]
			if super_mode
				sprite_index=sprites[? "uniques_sunbolt_u"]
			uniques_sunblast_cd_counter=UNIQUES_SUNBLAST_COOLDOWN
			uniques_sunblast_lockdown=1
			uniques_sunblast_has_made_hitbox=false
			
			float_counter=UNIQUES_SUNBLAST_FLOAT_COUNTER_AMOUNT
			vspd=min(vspd,0)   //if falling, stop fall
			break;
            
			case "bait_haymaker":
			image_speed=FRAME_SPEED_NORMAL
			sprite_index=sprites[? "uniques_heavyswing"]
			if super_mode
				sprite_index=sprites[? "uniques_heavyswing_u"]
			image_index=0
			uniques_sharkattack_lockdown=1 
			uniques_sharkattack_feet_counter=0
			uniques_sharkattack_has_made_hitbox=false
			break;
                        
			case -1:
			/*nandemonai*/     break;
			default:
			show_error("boop , unknown heavy attack called",true)
		}
	}
}


if attacks[? "heavy attack"]=="uga_falconpunch"     ///ooga heavy attack button release/max time    [finaledit] way to optimise maybe
{
	if uniques_fpunch_lockdown==1 && (   (!button_scrape[? heavybutton]  && uniques_fpunch_charge>UNIQUES_FPUNCH_CHARGE_MIN ) || uniques_fpunch_charge>UNIQUES_FPUNCH_CHARGE_MAX)   ///heavy attack   button-release/charge-timeout
	{
		image_speed=FRAME_SPEED_NORMAL
		image_index=4
		uniques_fpunch_charge=0
		uniques_fpunch_lockdown=2
	}
}
else if attacks[? "heavy attack"]=="vet_armspin"     ///vet heavy attack button release/max time    [finaledit] way to optimise maybe
{
	if uniques_spinner_attack_lockdown==1 && (   (!button_scrape[? heavybutton]  && uniques_spinner_attack_charge>UNIQUES_SPINNER_ATTACK_CHARGE_MIN ) || uniques_spinner_attack_charge>UNIQUES_SPINNER_ATTACK_CHARGE_MAX)   ///heavy attack   button-release/charge-timeout
	{
		image_speed=FRAME_SPEED_NORMAL
		image_index=11
		uniques_spinner_attack_charge=0
		uniques_spinner_attack_lockdown=2
	}
}


if button_scrape_pushed[? lightbutton]  && groundcheck==noone && player_may_attack()//////////////////////////////////////////////  air light attack (air grab)
{
	var exception;
	exception=false
    
	if holding_a_crab==true
	{
		exception=true
		player_throw_crab()
	}
    
	if !exception
	{
		switch attacks[? "air light attack"]
		{
			
			case "standard_airgrab":
			airgrab_mode="attempting"   /// airgrab thrown out (doesn't mean connected, just that attack has been created)

			aim_octilinear()
			var x_offset;
			x_offset=40
			if !right
				x_offset=-40
			
			var a;
			a=instance_create(x+x_offset,y,airgrab)
			a.creator=self.id
			a.x_offset=x_offset    ///airgrab is follower
			a.y_offset=0
			if !right
				a.image_xscale=-1
			
            
			sprite_index=sprites[? "airgrab"]
			if super_mode
				sprite_index=sprites[? "airgrab_u"]
			image_speed=FRAME_SPEED_FAST                                   break;
			case -1:
			/*nandemonai*/ break;
			default:
			show_error("boop , unknown air light attack called",true)
		}
	}
    
}


if button_scrape_pushed[? heavybutton] && groundcheck==noone && player_may_attack()       ///    air heavy attack
{
	var exception;
	exception=false
    
	if holding_a_crab==true
	{
		exception=true
		player_throw_crab()
	}
    
	if !exception
	{
		switch attacks[? "air heavy attack"]
		{
			case "veteran_mine_throw":  ///veteran mine throw
			if mines_ammo>0
			{
				mines_ammo-=1
				vspd=0
				aim_octilinear()   ///changes octdir variable.
				var a;
				a=instance_create(x,y-10,mine)
				a.right=right
				a.scale=1
				a.creator=a.id
				a.player_who_placed_mine=self.id
				a.direction=octdir
				with a
				{
					if direction==135 || direction==180 || direction==45 || direction==0 ||  direction==225 || direction==315
					{
						if direction>90
							hspd=-6
						else
							hspd=6
                            
						vspd=-5
					}
					else if direction==90
					{
						hspd=0
						vspd=-7
					}
					else if direction==270
					{
						hspd=0
						vspd=8
					}
 
				}
                
			}
			break;
		        
			case "slinger_air_sunbolt":
			image_index=0
			image_speed=FRAME_SPEED_NORMAL
			sprite_index=sprites[? "uniques_airsunbolt"]
			if super_mode
				sprite_index=sprites[? "uniques_airsunbolt_u"]
			uniques_airbolt_lockdown=1
			uniques_airbolt_has_made_hitbox=false
			break;
			
			case "no_effect":
			//nothing in particular
			break;
			
			default:
			show_error("new phone who dis",true)
			break;
		        
		}
	}
}

var rocketjumped;
rocketjumped=false





if (rocket_jump_input_time_counter_from_dash>0  || button_scrape_pushed[? dashbutton]  ) ///[finaledit] could happen with counters to free up check, optimisation.
{
	if (button_scrape_pushed[? upbutton]  || rocket_jump_input_time_counter_from_jump>0) && !button_scrape[? downbutton] 
	{
		if player_may_attack()
		{                                                           //////////////////////////////////////////////////////////////////////////////////////  
			if (groundcheck!=noone || rocket_jump_input_time_counter_from_jump>0) && dash_rocket_jump==0                                                        ////rocket jump
			{
				exception=true
				vspd=0
				dash_rocket_jump=1
				hspd=0
				sprite_index=sprites[? "rocketjump_charge"]    ///rocketjump freeze sprite
				if super_mode
					sprite_index=sprites[? "rocketjump_charge_u"]   ///rocketjump freeze super sprite
				image_speed=FRAME_SPEED_FAST
				image_index=0
				rocketjumped=true
			}
		} 
	}	
}

///////////////////        events for groundpound, and dash               /////////////
if button_scrape_pushed[? dashbutton]  && rocketjumped==false 
{
	var exception;
	exception=false
	
	///bait unique gp attack
	if uniques_dashgpblinkattack_enabled && !player_is_dashing() && groundcheck!=noone && button_scrape[? downbutton]  && uniques_baitchain_last_chained!=noone
	{ 
		uniques_dashgpblinkattack_lockdown=1
		image_speed=0.2
		image_index=0
		sprite_index=sprites[? "uniques_blinkjump_windup"]
		if super_mode
			sprite_index=sprites[? "uniques_blinkjump_windup_u"]
		exception=true
	}
	
	///groundpound
	if !exception && player_may_attack() && button_scrape[? downbutton] && groundcheck==noone && cangroundpound==0  
	{
		var dropcrabok;
		dropcrabok=true    ///if player can't gp then this stops crab being dropped
		switch attacks[? "gp"]
		{
			case "ground pound with phase": ///slinger phase
			case "ground pound": ////standard gp
			exception=true                                                                                                                                     
			vspd=0
			cangroundpound=1
			hspd=0
			sprite_index=sprites[? "gpfall"]
			if super_mode
				sprite_index=sprites[? "gpfall_u"]
			image_speed=FRAME_SPEED_FAST
			image_index=0
			ground_pound_freeze_counter=ground_pound_freeze_time           //ground pound freeze time
			ground_pound_extra_delay_counter=0   //for uga's delay
			break;
			case -1:
			dropcrabok=false
			break;
			default:
			show_error("boop beep, unknown gp attack id",true)
		}
		
		if holding_a_crab && dropcrabok
			player_drop_crab()
	}
	
	///climb roll
	if !exception && groundcheck==noone && player_not_locked_down()
	{
		var check_result;
		if right
			check_result=player_check_climb_roll_spacing("right")
		else
			check_result=player_check_climb_roll_spacing("left")
			
		if check_result!="do_not_roll"
		{
			exception=true
			show_debug_message(check_result)
			vspd=CLIMB_ROLL_1_BLOCK_VSPD
		}
	}
	
	///dash 
	if !exception && !button_scrape[? downbutton] && !player_is_dashing() && player_may_attack()
	{
		if cripple_debuff_counter<1
		{
			if holding_a_crab
				player_drop_crab()
				
			var player_dashed;
			player_dashed=false
			
               ///set specific dash attributes and make hitbox
			switch attacks[? "dash"]   
			{                      
				case "bunt_dash":   ///classic dash
				
                		player_dashed=true
					
					//set dash delay counter
					if dash_delay_before_can_attack_counter<1
						dash_delay_before_can_attack_counter=20
                    

					///make dash hitbox
					var cut_through_terrain;
					cut_through_terrain=true
					if groundcheck==noone
						cut_through_terrain=false

					dash_current_hitbox_object=attack_create_dash_hitbox(true,15,7,4,"dash",dasheroo,0.33,true,cut_through_terrain)
					if !right
						dash_current_hitbox_object.direction=180
					dash_current_hitbox_object.image_speed=0.05    ///means dash hitbox won't timeout (but will die when whacked or dash end)

					//set dash specific speed
					ground_dash_speed=14
					
				break;

				default:
				show_error("booop, unknown dash attack called",true)
			}
			
			
               ///if dash button perfoms a normal dash, set dash sprite, hspd, cooldown and effect
			if player_dashed   
			{
				sprite_index=sprites[? "dash"]                     ///////////////////   dash  sprite
				if super_mode
					sprite_index=sprites[? "dash_u"]
				image_index=0
				image_speed=FRAME_SPEED_NORMAL
				
				rocket_jump_input_time_counter_from_dash = ROCKET_JUMP_INPUT_TIME_ALLOWED_FROM_DASH
				//show_debug_message(choose(" ","  ")+"rocket jump input time counter from dash set to 5")
				
				
				///set initial horizontal movement (continually reset as player holds down button)
				if right 
					hspd=ground_dash_speed
				else
					hspd=-ground_dash_speed
				
				if groundcheck!=noone
					dash_has_lifted_off_ground=false
				else
					dash_has_lifted_off_ground=true

				ground_dash_counter=0

                
				dashcd=DASH_COOLDOWN_TIME    ///dash cooldown time (also DASH LOCKDOWN TIME, THOUGH THERE IS A FORGIVE MECHANIC IF IT HITS WALL)     
				dash_button_currently_held=true

				
				///   dash trail effect
				var a;
				a=effect_aniend(dash_no_ULT,0.2,1)              
				if super_mode
				{
					if P==0 || P==2
						a.sprite_index=p1_dash_ULT  //[finaledit] sprites for p2/3/4
					if P==1 || P==3
						a.sprite_index=p2_dash_ULT
				}
				if !right
					a.image_xscale=-1


				if groundcheck==noone           ////////dashing in air
				{
					vspd=-air_dash_vspeed
					if right
						hspd=air_dash_speed
					else
						hspd=-air_dash_speed
						
					alarm[5]=5              ////hspd gets slowed 2 steps later    
					if right
						a.image_angle=45   ///a still refers to trail effect
					else
						a.image_angle=315
				}
                
				//cancel parachute
				if uniques_parachute==1
					uniques_parachute=2  
					
					
				 ////'push' tornado if under it
				if instance_exists(tornadoe)   
				{
					for (var i = 0; i < instance_number(tornadoe); i++)
					{
						var t = instance_find(tornadoe,i)
						
						if x>t.x-t.WIDTH/2-75 && x<t.x+t.WIDTH/2+75
						{
							if right
								t.hspd=t.pushed_speed
							else
								t.hspd=-t.pushed_speed
							

						}
					}
					
				}
                
				if sidezap==true                              ////////////////////     kanehameha
				{
					sidezap=false
					var a;
					a=instance_create(x,y,magicbolt)
					create_terrain_cutter(magicbolt, "gilded", right*180, -1)
					a.creator=self.id
				}
			}
		}
	}
}

////hold dash button event
if button_scrape[? dashbutton] 
{
	if dash_button_currently_held && dash_has_lifted_off_ground==false    ////continues momentum of ground dash
	{
		if image_index>3
			image_index=1
			
		if right
			hspd=ground_dash_speed
		else
			hspd=-ground_dash_speed
		ground_dash_counter+=1
		
		var a;
		a=effect_aniend(dash_dirt_particle,0.5+random(0.3),-2)
		a.y+=random(3)
		if !right
			a.image_xscale=-1
	}


	if uniques_uga_delayable_gp_enabled && ground_pound_freeze_counter>0
	{
		if ground_pound_extra_delay_counter<GROUND_POUND_EXTRA_DELAY_MAX
		{
			ground_pound_extra_delay_counter+=1
			ground_pound_freeze_counter+=1
		}
	}
}

//////end ground dash
if dash_button_currently_held 
{ 
	if (button_scrape_released[? dashbutton] || (ground_dash_counter>GROUND_DASH_MAX))  && dash_has_lifted_off_ground==false
	{
		if dash_current_hitbox_object!=noone
		{
			if instance_exists(dash_current_hitbox_object)
				dash_current_hitbox_object.image_speed=0.3   ///kills it
		}
		
		dash_current_hitbox_object=noone
		ground_dash_counter=0
		dash_button_currently_held=false
	}
}



////////////////////////////////////////////// slinger phase on downkey (separate because of HA exception
if button_scrape_pushed[? downbutton]
{
	if uniques_phase_enabled && uniques_phase_counter>0
	{ 	
		if player_can_phase()
		{
			if sprite_index!=sprites[? "phase"]
				image_index=0
			image_speed=FRAME_SPEED_NORMAL
			sprite_index=sprites[? "phase"]
			isteps=10
		}
	}	
}

///////////////////////////////////////////// downkey while on ground (placeables etc)
if button_scrape_pushed[? downbutton] && player_may_attack() && !button_scrape[? leftbutton] && !button_scrape[? rightbutton]
{
	if groundcheck!=noone
	{
		switch attacks[? "special hold down"] 
		{
			case "no_effect":
			///whoop whoop
			break;
		
			case "vet_place_mine":
			if uniques_vet_digging==0
			{
				if uniques_mines_enabled  && groundcheck!=noone
				{
					if mines_ammo>0                ///start place mine animation
					{
						if sprite_index!=sprites[? "uniques_place_mine"]
							image_index=0
						image_speed=FRAME_SPEED_NORMAL
						sprite_index=sprites[? "uniques_place_mine"]
					}
				} 
			}
			break;
        
        
        
			case "bait_teleport":
			if uniques_teleport_enabled==1      ////start place/use teleport animation
			{
				if sprite_index!=sprites[? "uniques_place_teleport"] && sprite_index!=sprites[? "uniques_use_teleport"]
				{
					image_speed=FRAME_SPEED_NORMAL
					image_index=0
					sprite_index=sprites[? "uniques_place_teleport"]
					if uniques_teleport==1
						sprite_index=sprites[? "uniques_use_teleport"]
				}

			}

        
			break;
		}
	}
}

player_check_teleport_release()

player_check_rocket_jump_release()

////////////////////////////////////////////////////////// BASIC MOVEMENT //////////////////////////////////////////////////////////////////////////////
player_special_case_turn_right_or_left()

player_handle_move_right_or_left()

player_handle_jump()

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

player_vet_parachute_sprite_check()

player_falldown_sprite_check()

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/* movement engine (and charge-up movements and room ceiling death check)*/
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

///////////////////////////////////////////////////////////////////////////////////////////////////////////// HORIZONTAL MOVEMENT

player_move_horizontal()


////////////////////  end specials when hitting screen edge
if edgeofroomcheck
{
	if uniques_whirlwind_active
		player_bait_end_whirlwind_if_at_screen_edge()
	if uniques_vet_kamikaze_lockdown==2
		uniques_vet_kamikaze_lockdown=3
}

////////////// CHARGE ATTACKS/MOVEMENTS AND ANIMATION LOOP
attack_shooting_animation_checks()




//LIMIT VSPD
if vspd>10 && cangroundpound!=2 && airgrab_mode!="being_airgrabbed" && float_counter<1 && canbounce_counter<1
	vspd=10
	
player_move_vertical()

///////////////////////////////////////////////////////////////////////////////////////// HORIZONTAL BLOCK CHECKS
if player_not_digging() 
{
	player_horizontal_block_check_collision("left")
	player_horizontal_block_check_collision("right")
}


///////////////////////////////////////////////////////////////////////////////////////////////// HORIZONTAL FRICTION AND HSPD LIMIT
player_set_friction()


if is_proned           /////ROLL EVENT 
{
	if cannot_roll_counter<1
	{
		if button_scrape[? leftbutton] || button_scrape[? rightbutton]      
		{
			is_proned=false
			sprite_index=sprites[? "roll"]
			image_index=0
			image_speed=0.2
			roll_lockdown=1
			isteps=18
			if button_scrape[? leftbutton]
			{
				hspd=-ROLL_HSPEED
				right=false
			}
			else
			{
				hspd=ROLL_HSPEED
				right=true
			}
		}
	}
}
else if before_prone_falling_lockdown                     /////REMAIN IMMUNE WHILE IN BEFORE_PRONE STATE
{
	player_make_immune(2)
}

if uniques_vet_digging==2
{	
	if button_scrape_pushed[? heavybutton] && mines_ammo-instance_number(drillmine) >0 && uniques_drill_mine_place_animation_lock==false
	{
		uniques_drill_mine_place_animation_lock=true
		sprite_index=sprites[? "uniques_dig_place_mine"]
		if super_mode
			sprite_index=sprites[? "uniques_dig_place_mine_u"]
		var a;
		a=instance_create_depth(x,y,-1,drillmine)
		a.creator=self.id
		a.right=right
		a.scale=1
		mines_ammo-=1
	}
	
	
	var SPD,stop;
	SPD=5
	stop=false
	if right
	{
		if place_meeting(x+SPD,y,block) && x+SPD<kouchou.room_right_border_x
			x+=SPD
		else
			stop=true
	}
	else
	{
		if place_meeting(x-SPD,y,block)  && x-SPD>kouchou.room_left_border_x
			x-=SPD
		else
			stop=true
	}
	
	if stop
	{
		attack_vet_dig_cancel()
		uniques_vet_digging=0
		dash_rocket_jump_charge=1
		attack_rocket_jump()
		effect_create_above(ef_firework,x,y,c_red,2)
	}
	
}

if uniques_vet_kamikaze_lockdown==2 
{
	if image_index>7
		image_index=6
	isteps=5
	
	if right
		hspd=UNIQUES_VET_KAMIKAZE_HSPEED
	else
		hspd=-UNIQUES_VET_KAMIKAZE_HSPEED
		
	if instance_exists(uniques_vet_kamikaze_dash_current_hitbox_object)
	{
		uniques_vet_kamikaze_dash_current_hitbox_object.image_index=0
		if right
			uniques_vet_kamikaze_dash_current_hitbox_object.image_xscale=1
		else
			uniques_vet_kamikaze_dash_current_hitbox_object.image_xscale=-1
	}
	
	if instance_exists(uniques_vet_kamikaze_victim)
	{
		uniques_vet_kamikaze_victim.x=x
		uniques_vet_kamikaze_victim.y=y-30
		uniques_vet_kamikaze_victim.stunned_groundpound=75   ///needs to last until animation end stun hits
	}
}


//////////////////////////////////////////////////////////////////////////////////////////////////////// TOP SCREEN DEATH
player_check_if_off_top_of_screen()



////end step stuff
groundcheck_prev=groundcheck