///////////////////////////////////////////////
/*step event///////////////////////////////////
*//////////////////////////////////////////////

if canbounce_counter>0   //if bounce enabled, and will hit block below, reverse vspd and move player up one pixel. must happen before groundcheck
{
	if place_meeting(x,y+vspd,block)      /////    bounce upward
	{
		if canbounce_counter>MAX_CANBOUNCE_COUNTER
			canbounce_counter=MAX_CANBOUNCE_COUNTER
		vspd=clamp(-BOUNCE_MIN_VELOCITY,-abs(vspd),-BOUNCE_MAX_VELOCITY)
		if !place_meeting(x,y-1,block)
			y-=1
	}
}


//////////////////////////////////////////     groundcheck
var id_of_groundpounded_instrument_if_exists
id_of_groundpounded_instrument_if_exists=noone


groundcheck=instance_place(x,y+1,block)  ///[finaledit] 
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
	else if groundcheck.object_index==instrument
	{
		id_of_groundpounded_instrument_if_exists=instance_place(x,y+1,instrument)
	}
}
else ///( if groundcheck==noone)
{
	dash_has_lifted_off_ground=true
}

var watery,wateryjump;
watery=1
wateryjump=1
if instance_exists(wave)
{
	if y>wave.y+30
	{
		watery=2   ///gravity divided by this number underwater
		wateryjump=0.75 ///jump timesed by this number underwater
	}
} 

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/*  emmiters  */
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


if super_mode && random(1)>0.6      ///////////super effect
{
	var a;
	a=instance_create(x,y,ef_stunspiral)
	a.sprite_index=supersparkle_sprite
	a.targ=self.id
	a.depth=-2
	a.offsetx=0
	a.offsety=0
	a.image_speed=0.25
	a.image_xscale=1.25
	a.image_yscale=1.25
}
if sidezap && random(1)>0.8        /////////////kanehameha effect
{
	var a;
	a=effect_aniend(flameofsidezap,0.25,-1)
	a.x+=6-random(12)
	a.vspeed=choose(0,-1,-2)
	a.image_alpha=0.8
	if a.vspeed==-2
		a.image_alpha=0.5
}

if cursed==true && random(1)>0.6
{
	with effect_aniend(imdyinginside,0.4,-1)
		vspeed=-2
}


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
if STUNNED>0
{
	STUNNED-=1
}
if STUNNED2>0
{
	STUNNED2-=1
	if STUNNED2==0
	{
		if recoil_sprite_counter>0   ///[finaledit] could give this the groundcheck treatment and only check once
		{
			sprite_index=sprites[25]
			if super_mode
				sprite_index=sprites[26]
		}
		else
		{
			sprite_index=sprites[0]
			if super_mode
				sprite_index=sprites[9]
		}
	}
}
else                                                   ////////////health blending
{
	//////HP   [finaledit]
	if H==3
	{
		image_blend=c_white
	}
	if H==2
	{
		image_blend=make_colour_rgb(183, 245, 115)
		if P>2
			image_blend=make_colour_rgb(183, 245, 215)
	}
	if H==1
	{
		image_blend=make_colour_rgb(229, 172, 0)
		if P>2
			image_blend=make_colour_rgb(229, 172, 100)
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
	show_debug_message("from jump = "+string(rocket_jump_input_time_counter_from_jump))
}

if rocket_jump_input_time_counter_from_dash>0
{
	rocket_jump_input_time_counter_from_dash-=1
	show_debug_message("from dash = "+string(rocket_jump_input_time_counter_from_dash))
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
		for (i=0; i<ds_list_size(sprites_below_recoil_priority); i+=1)
		{
			if sprites[sprites_below_recoil_priority[| i]]==sprite_index
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

if fpunch_lockdown==1
{
	fpunch_charge+=1
}
if fpunch_cd_counter>0
{
	fpunch_cd_counter-=1
}
if uniques_aapunch_cd_counter>0
{
	uniques_aapunch_cd_counter-=1
}
if uniques_vet_chain_counter>0
{
	uniques_vet_chain_counter-=1
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
if fuckoff_slowed_counter>0
{
	fuckoff_slowed_counter-=1
	if slowed_show_trail
		effect_aniend(mightyannoying_slow_debuff_effect,0.25,-3)    
}
if canbounce_counter>0
{
	canbounce_counter-=1
	effect_aniend(bounce_debuff_effect,0.25,-3)
}

if dash_rocket_top_collision_safety>0
{
	dash_rocket_top_collision_safety-=1
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

if iframes>0
	iframes-=1



///////////////////////////////////////////////////////////////////////////////       (during airgrab throw && the throw event itself)                    AIRGRAB THROW EVENT
if airgrab_mode==2 && airgrab_decidedir_time>0
{
	if instance_exists(airgrab_target) && airgrab_target!=-1    /// position grabbed target infront of character
	{
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
			case 0:   ///standard airgrab
			if instance_exists(airgrab_target) && airgrab_target!=-1   ///if airgrab target exists, apply throw
			{
                
				var throwside;   ///whether throwing left or right, to be passed to airgrab target
				throwside=right
				var at;
				at=AIRGRAB_STUN_TIME;
                
				with airgrab_target
				{
					player_flush_lockdowns()
					canbounce_counter=at
					STUNNED2=at
					airgrab_mode=3
					if throwside==true
						hspd=7.5
					else
						hspd=-7.5
					vspd=18
                    
					hothands+=1                         //// ONE HH DAMAGE
					player_hothands_check()
				}
				hothands=0                              //// RESETS THROWERS HH
			}
			
			airgrab_mode=3
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

if groundcheck==noone && cangroundpound!=1 && dash_rocket_jump!=2 && airgrab_mode!=2 && airgrab_mode!=4      /// player gravity
{  
	if vspd<0
		vspd+=GRAVITY/watery
	else
	{
		if vspd<VSPEED_FROM_GRAVITY_DOWN_MAX
			vspd+=GRAVITY_DOWN/watery
	}
}
if groundcheck!=noone && (dash_rocket_jump==3 || dash_rocket_jump==0) /// vertical block collision below (don't count as landed if launching rocket jump)
{
	airgrab_mode=0
	
	if uniques_whirlwind_active
	{
		iframes=1
		//attack_create_hitbox(stun amount, number of hh, reset attacker hh, reset opponent,gain meter on hit,attack name,sprite,image speed,active steps,hkb,vkb)
		attack_create_hitbox(30,1,true,true,true,"whirlwind",spr_whirlwind_hitbox,1,99,4,5)
		
		if right
			hspd=UNIQUES_WHIRLWIND_SPEED
		else
			hspd=-UNIQUES_WHIRLWIND_SPEED
	}
		


	if  cangroundpound==2   ////GROUNDPOUND EFFECT EVENT
	{
		effect_aniend(groundpoundeffect,0.4,-2)
		
		var exception;
		exception=false
		if unique_ooga_gp_charges>0 && uniques_super_ooga_gp_enabled==true    ///////////////////////////ooga super gp
		{
			exception=true
			attack_ooga_ultimate()
		}
		
		if !exception
		{
			switch attacks[? "gpeffect"]
			{
				case 0:
				//nandemonai
				break;
				case 1:   ////bait whirlwind
				image_index=0
				image_speed=FRAME_SPEED_FAST
				sprite_index=sprites[84]
				uniques_whirlwind_active=true
			}
		}		
		////collide gp with instrument below it
		if id_of_groundpounded_instrument_if_exists!=noone
		{
			with id_of_groundpounded_instrument_if_exists
			{
				if protection<1
				{
					block_take_damage()
				}
			}
		}
	}

	if jumped                            ///////////after landing from a jump , slow the player for a bit
	{
		mild_slowed_counter=16
		if cangroundpound!=0  
		{
			mild_slowed_counter=0
			fuckoff_slowed_counter=10
		}
		//effect_create_above(ef_firework,x,y,2,c_blue)
	}
	cangroundpound=0
	dash_rocket_jump=0
	jumped=false
	if groundcheck!=groundcheck_prev
		instance_create(x,y,jump_vibration)
	vspd=0
	doublejump=0

	//////vet parachute turn off
	if uniques_parachute>0
	{
		uniques_parachute=0 
		if sprite_index==sprites[64] || sprite_index==sprites[65]
		{
			sprite_index=sprites[4]  //fall sprite
			if super_mode
				sprite_index=sprites[12] //fall super sprite
		}
	}
    
	////////////////////////////////////////////////if falling and not recoiling, set sprite back to idle
	if sprite_index==sprites[4]   ///fall sprite
	{
		sprite_index=sprites[0]   ///idle sprite
		if recoil_sprite_counter>0
		{
			sprite_index=sprites[25]
		}
	}
	
	if sprite_index==sprites[12]  ///fall super sprite
	{
		sprite_index=sprites[9]   ///idle super sprite
		if recoil_sprite_counter>0
		{
			sprite_index=sprites[26]
		}
	}
}

if vspd<0
{
	if place_meeting(x,y-1,block) /// vertical block collision above
	{
		vspd=0
	}
}


//set to idle sprite if on ground and not pushing left or right
if !checkkey(leftbutton) && !checkkey(rightbutton) && groundcheck!=noone
{
	var pass;
	pass=false
	for (i=0; i<ds_list_size(sprites_below_idle_priority); i+=1)
	{
		if sprites[sprites_below_idle_priority[| i]]==sprite_index
		{
			pass=true
			break;
		}
	};
        
	if pass
	{
		if recoil_sprite_counter>0
		{
			sprite_index=sprites[25]
			if super_mode
				sprite_index=sprites[26]
		}
		else
		{
			sprite_index=sprites[0]
			if super_mode
				sprite_index=sprites[9]
		}
		image_speed=FRAME_SPEED_NORMAL
	}
}


////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/*  key pressed and abilities */
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


if checkkey(lightbutton) && checkkey(heavybutton)                                               /////// pocket event
{
	pocket_light_heavy_held_counter+=1
	if pocket_light_heavy_held_counter>3
	{
		if pocket_orb==-1
		{
			var a;
			a=adjacent_to_instrument()
			if a>0
			{
				if a.protection<1
				{
					effect_create_above(ef_firework,x,y,2,c_green)
					pocket_light_heavy_held_counter=-1000
					pocket_orb=a.type
					aizen.playerpocketorb[P]=a.sprite_index
					with a
					{
						dontmakeorb=true
						instrument_die_event()
					}
				}
			}
		}
        
		else if aizen.mode==0
		{
			effect_create_above(ef_firework,x,y,2,c_red)
			stack_add_orb(pocket_orb,true)
			pocket_orb=-1 //contiune
			aizen.playerpocketorb[P]=-1
		}
	}

}


if checkkey_released(lightbutton) || checkkey_released(heavybutton) || checkkey(leftbutton) || checkkey(rightbutton) || checkkey(upbutton) //////pocket keys release event
{
	pocket_light_heavy_held_counter=0
}






if checkkey_pushed(lightbutton) && groundcheck!=noone && player_may_attack() && pocket_light_heavy_held_counter<1  ////light attack / push
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
	
	if !exception && uniques_vet_chain_counter>0    //////vet LA => LA  forwardpunch chain
	{
		exception=true
		uniques_forwardpunch_has_made_hitbox=false
		uniques_forwardpunch_lockdown=1
		uniques_forwardpunch_feet_counter=0
		uniques_vet_chain_counter=-1
        
		image_speed=FRAME_SPEED_NORMAL
		sprite_index=sprites[62]
		if super_mode
			sprite_index=sprites[63]
		image_index=0
	}
    

    
    
	if !exception && canpush
	{   
		var spawn_normal_uc_hitbox,uc_hitbox_shape,la_attackname,extrahkb;
		spawn_normal_uc_hitbox=false
		la_attackname="error"
		extrahkb=0
        
		switch attacks[? "light attack"]
		{
			case 0:  //ooga
			la_attackname="oogauppercut"
			spawn_normal_uc_hitbox=true
			uc_hitbox_shape=bammeroo 
			extrahkb=3 break;
            
			case 1:    ///veteran light attack (chains) 
			la_attackname="veteranuppercut"
			uniques_vet_chain_counter=UNIQUES_VET_CHAIN_COUNTER_TIME
			spawn_normal_uc_hitbox=true
			uc_hitbox_shape=bammeroo break;
            
			case 2:   ///slinger held jump light attack
			la_attackname="slingeruppercut"
			spawn_normal_uc_hitbox=true
			uc_hitbox_shape=bammeroo break;
            
			case 3:    ////bait chainer attack
			la_attackname="baitchain"
			spawn_normal_uc_hitbox=true
			uc_hitbox_shape=bammeroo break;
            
			case -1:            
			/*nandemonai*/        break;
            
			default:
			show_error("boop , unknown light attack called",true)
		}
        
		if spawn_normal_uc_hitbox
		{
			if la_attackname=="error"
				show_error("invalid attack name recieved",true)
			canpush=false
			push_other_attacks_timer=PUSH_OTHER_ATTACKS_TIME
			alarm[1]=PUSH_COOLDOWN   
			sprite_index=sprites[17]
			if super_mode
				sprite_index=sprites[18]
			image_index=0
			image_speed=FRAME_SPEED_NORMAL
            
			attack_create_hitbox(30,1,true,true,true,la_attackname,uc_hitbox_shape,1,99,7+extrahkb,4)
		}
	}
}

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// heavy attack
if checkkey_pushed(heavybutton) && player_may_attack() && fpunch_cd_counter<1 && groundcheck!=noone   && pocket_light_heavy_held_counter<1  ///heavy attack button press
{
	var exception;
	exception=false
    
	if holding_a_crab    ////throw crab
	{ 
		exception=true
		player_throw_crab()
	}
	
	if !exception
	{
		switch attacks[? "heavy attack"]
		{
			case 0:    ////ooga default heavy attack
			image_speed=FRAME_SPEED_FAST
			sprite_index=sprites[21]
			if super_mode
				sprite_index=sprites[22]
			image_index=0
			fpunch_lockdown=1
			fpunch_cd_counter=FPUNCH_COOLDOWN
			fpunch_feet_counter=0
			fpunch_has_made_hitbox=false
			break;
            
            
			case 1:    //// veteran aa punch
			image_speed=FRAME_SPEED_FAST
			sprite_index=sprites[60]
			if super_mode
				sprite_index=sprites[61]
			image_index=0
			uniques_aapunch_cd_counter=UNIQUES_AAPUNCH_COOLDOWN
			uniques_aapunch_lockdown=1
			break;
               
			case 2:  ////slinger sunblast
			image_index=0
			image_speed=FRAME_SPEED_NORMAL
			sprite_index=sprites[70]
			if super_mode
				sprite_index=sprites[71]
			uniques_sunblast_cd_counter=UNIQUES_SUNBLAST_COOLDOWN
			uniques_sunblast_lockdown=1
			uniques_sunblast_has_made_hitbox=false
            
			break;
            
			case 3:    ////bait shark attack heavy punch
			image_speed=FRAME_SPEED_NORMAL
			sprite_index=sprites[80]
			if super_mode
				sprite_index=sprites[81]
			image_index=0
			uniques_sharkattack_lockdown=1 
			uniques_sharkattack_cd_counter=UNIQUES_SHARKATTACK_COOLDOWN
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
if attacks[? "heavy attack"]==0     ///ooga heavy attack button release    [finaledit] way to optimise maybe
{
	if fpunch_lockdown==1 && (   (!checkkey(heavybutton) && fpunch_charge>FPUNCH_CHARGE_MIN ) || fpunch_charge>FPUNCH_CHARGE_MAX)   ///heavy attack   button-release/charge-timeout
	{
		image_speed=FRAME_SPEED_NORMAL
		image_index=4
		fpunch_charge=0
		fpunch_lockdown=2
	}
}

if checkkey_pushed(lightbutton) && groundcheck==noone && player_may_attack()//////////////////////////////////////////////  air light attack (air grab)
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
			case 0:
			airgrab_mode=1   /// airgrab thrown out (doesn't mean connected, just that attack has been created)

			aim_octilinear()
			var xx,yy;
			xx=lengthdir_x(AIRGRAB_RANGE_VERTICAL,octdir)
			yy=lengthdir_y(AIRGRAB_RANGE_HORIZONTAL,octdir)
			var a;
			a=instance_create(x+xx,y+yy+15,airgrab)
			a.creator=self.id
			a.xx=xx
			a.yy=yy+15
			
            
			sprite_index=sprites[23]
			if super_mode
				sprite_index=sprites[24]
			image_speed=FRAME_SPEED_FAST                                   break;
			case -1:
			/*nandemonai*/ break;
			default:
			show_error("boop , unknown air light attack called",true)
		}
	}
    
}

if checkkey_pushed(heavybutton) && groundcheck==noone && player_may_attack()       ///    air heavy attack
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
			case 0:  ///veteran mine throw
			if mines_ammo>0
			{
				mines_ammo-=1
				vspd=0
				aim_octilinear()   ///changes octdir variable.
				var a;
				a=instance_create(x,y-10,mine)
				a.creator=self.id
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
		        
		        	case 1:  ////slinger sunbolt
			image_index=0
			image_speed=FRAME_SPEED_NORMAL
			sprite_index=sprites[72]
			if super_mode
				sprite_index=sprites[73]
			uniques_airbolt_lockdown=1
			uniques_airbolt_has_made_hitbox=false

		        
		}
	}
}

var rocketjumped;
rocketjumped=false


if (rocket_jump_input_time_counter_from_dash>0  || checkkey_pushed(dashbutton) )  ///[finaledit] could happen with counters to free up check, optimisation.
{
	if (checkkey_pushed(upbutton) || rocket_jump_input_time_counter_from_jump>0) && !checkkey(downbutton)
	{
		if player_may_attack()
		{                                                           //////////////////////////////////////////////////////////////////////////////////////  
			if (groundcheck!=noone || rocket_jump_input_time_counter_from_jump>0) && dash_rocket_jump==0                                                        ////rocket jump
			{
				exception=true
				vspd=0
				dash_rocket_jump=1
				hspd=0
				sprite_index=sprites[30]    ///groundpound freeze sprite
				if super_mode
					sprite_index=sprites[31]   ///groundpound freeze super sprite
				image_speed=FRAME_SPEED_FAST
				image_index=0
				rocketjumped=true
			}
		} 
	}	
}


if checkkey_pushed(dashbutton)               /////////////////////////////////////                        events for    rocket jump, groundpound, and dash 
{
	var exception;
	exception=false
	if rocketjumped
		exception=true

	if !exception && player_may_attack() && checkkey(downbutton) && groundcheck==noone && cangroundpound==0   //////////////////////////////////////////////////////////////////////////////////////     
	{///                                                                                                                                                    groundpound
		var dropcrabok;
		dropcrabok=true    ///if player can't gp then this stops crab being dropped
		switch attacks[? "gp"]
		{                   
			case 0: ////standard gp
			exception=true                                                                                                                                     
			vspd=0
			cangroundpound=1
			hspd=0
			sprite_index=sprites[5]
			if super_mode
				sprite_index=sprites[7]
			image_speed=FRAME_SPEED_FAST
			image_index=0
			alarm[2]=GROUD_POUND_FREEZE_TIME           //ground pound freeze time
			break;
			case -1:
			dropcrabok=false
			break;
			default:
			show_error("boop beep, unknown gp attack id",true)
		}
		if holding_a_crab && dropcrabok
		{
			player_drop_crab()
		}
	}
	//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////    
	if !exception && !checkkey(downbutton) && dashcd<1 && player_may_attack()                       /////////////////////////////////////////////////////////DASH EVENT 
	{
		if cripple_debuff_counter<1
		{
			if holding_a_crab
			{
				player_drop_crab()
			}
			var player_dashed;
			player_dashed=false
            
			switch attacks[? "dash"]    ///specific dash stuff
			{ 
				case 1:   /// (was once veteran dash but has now been removed)
				/*nandemonai*/
				break;     
		
		
				case 2:   ///slinger nobunt dash

				if dash_attacks_allowed_counter<1
					dash_attacks_allowed_counter=12
                    
				dash_current_hitbox_object=attack_create_dash_hitbox(false,0,0,0,"slingerjumpresetdash",dasheroo,0.33,false)
				if !right
					dash_current_hitbox_object.direction=180
				player_dashed=true
				ground_dash_speed=10.5
                
				break;                          
				case 0:   ///bunt dash
                
				if dash_attacks_allowed_counter<1
					dash_attacks_allowed_counter=20
                    
				dash_current_hitbox_object=attack_create_dash_hitbox(true,15,7,4,"dash",dasheroo,0.33,true)
				if !right
					dash_current_hitbox_object.direction=180
				player_dashed=true
				ground_dash_speed=9.5  
				
				break;

				case -1:
				/*nandemonai*/  break;
				default:
				show_error("booop, unknown dash attack called",true)
			}
            
			if player_dashed    ///generic dash stuff
			{
				sprite_index=sprites[15]                     ///////////////////   dash  sprite
				if super_mode
					sprite_index=sprites[16]
				image_index=0
				image_speed=FRAME_SPEED_NORMAL
                
				rocket_jump_input_time_counter_from_dash = ROCKET_JUMP_INPUT_TIME_ALLOWED_FROM_DASH
				show_debug_message(choose(" ","  ")+"rocket jump input time counter from dash set to 5")
				
				if right                                       //////////////////    dash initial movement
					hspd=ground_dash_speed
				else
					hspd=-ground_dash_speed
				
				if groundcheck!=noone
				{
					dash_has_lifted_off_ground=false
					dash_current_hitbox_object.image_speed=0.05    ///means dash hitbox won't timeout (but will die when whacked or dash end)
				}
				else
					dash_has_lifted_off_ground=true

				ground_dash_counter=0

                
				dashcd=DASH_COOLDOWN_TIME    ///dash cooldown time (also DASH LOCKDOWN TIME, THOUGH THERE IS A FORGIVE MECHANIC IF IT HITS WALL)     
				dash_button_currently_held=true

				
				
				var a;
				a=effect_aniend(dash_no_ULT,0.2,1)               //////////////   dash trail effect
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
					vspd=-AIR_DASH_VSPEED
					if right
						hspd=AIR_DASH_SPEED
					else
						hspd=-AIR_DASH_SPEED
						
					alarm[5]=5              ////hspd gets slowed 2 steps later    
					if right
						a.image_angle=45   ///a still refers to trail effect
					else
						a.image_angle=315
				}
                
				if uniques_parachute==1
					uniques_parachute=2   //dash cancels parachute
                
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
if checkkey(dashbutton)
{
	if dash_button_currently_held==true && dash_has_lifted_off_ground==false    ////continues momentum of ground dash
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
		
		//show_debug_message(string(ground_dash_counter))
		//effect_create_above(ef_firework,x,y,0,c_aqua)
	}
}
//////end ground dash
if dash_button_currently_held 
{
	if (checkkey_released(dashbutton) || (ground_dash_counter>GROUND_DASH_MAX))  && dash_has_lifted_off_ground==false
	{
		if dash_current_hitbox_object!=noone
		{
			if instance_exists(dash_current_hitbox_object)
			{
				dash_current_hitbox_object.image_speed=0.3   ///kills it
			}
		}
		dash_current_hitbox_object=noone
		ground_dash_counter=0
		dash_button_currently_held=false
		//show_debug_message("dash_button_currently_held set to false")
		hspd=(hspd/3)*2
		//effect_create_above(ef_firework,x,y,1,c_red)
	}
}



///////////////////////////////////////////// downkey while on ground (placeables etc)
if checkkey_pushed(downbutton) && player_may_attack() && !checkkey(leftbutton) && !checkkey(rightbutton) && groundcheck !=noone
{
	switch attacks[? "special hold down"] 
	{
		case 0:     ////veteran 

		if uniques_vet_dig_enabled && uniques_vet_chain_counter>0 && checkkey(lightbutton) && uniques_vet_digging==0
		{
			image_index=0
			image_speed=FRAME_SPEED_NORMAL
			uniques_vet_digging=1
			y+=40
			sprite_index=sprites[66]
			if super_mode
				sprite_index=sprites[67]
		}
		
		if uniques_vet_digging==0
		{
			if uniques_mines_enabled  && groundcheck!=noone
			{
				if mines_ammo>0                ///start place mine animation
				{
					if sprite_index!=sprites[32]
						image_index=0
					image_speed=FRAME_SPEED_NORMAL
					sprite_index=sprites[32]
				}
			} 
		}
		break;
        
        
        
		case 1:   //bait teleport
		if uniques_teleport_enabled==1      ////start place/use teleport animation
		{
			if sprite_index!=sprites[82] && sprite_index!=sprites[83]
			{
				image_speed=FRAME_SPEED_NORMAL
				image_index=0
				sprite_index=sprites[82]
				if uniques_teleport==1
					sprite_index=sprites[83]
			}

			/*if !instance_exists(uniques_my_teleport_id)
			{   ///if teleport got destroyed, reset variables and instead try to place teleport next step
				uniques_teleport=0
				uniques_my_teleport_id=-4
				sprite_index=sprites[82]
			}*/
		}

        
		break;
	}
}

if checkkey_released(downbutton)
{ ////// down button hold counter reset (for abilities like place mine)
	if sprite_index==sprites[82] || sprite_index=sprites[83]
	{
		player_set_idle()
	}
}


if dash_rocket_jump==1
{
	if !checkkey(upbutton)
	{ ////early release of rocket jump
		if dash_rocket_jump==1 && (sprite_index=sprites[30] || sprite_index==sprites[31])
		{
			if image_index>DASH_ROCKET_JUMP_CHARGE_LEVEL_1_THRESHOLD
				dash_rocket_jump_charge=1
			if image_index>DASH_ROCKET_JUMP_CHARGE_LEVEL_2_THRESHOLD
				dash_rocket_jump_charge=2
			if dash_rocket_jump_charge!=0
				attack_rocket_jump()
		}
	}
}



if (cangroundpound=3 && STUNNED2<1 && player_not_locked_down()  )   ||   airgrab_decidedir_time>0   ///allow update direction during groundpound or groundpound bounce
{
	if checkkey(leftbutton) 
	{
		image_xscale=-1
		right=false
	}
	if checkkey(rightbutton)     ///right > left
	{
		image_xscale=1
		right=true
	}
}
////////////////////////////////////////////////////////// BASIC MOVEMENT //////////////////////////////////////////////////////////////////////////////
if checkkey(leftbutton) && !checkkey(rightbutton) && (cangroundpound==0 || cangroundpound==3) && (dashcd<DASH_COOLDOWN_TIME-DASH_LOCKDOWN_TIME || dash_wallbreak_forgive==true) && airgrab_mode!=2 && airgrab_mode!=4 && !uniques_whirlwind_active
{                                                                                /// move LEFT
////###remember to change for right code too if changing this!!!!! ###////////////////////////////////
	if STUNNED==0 && STUNNED2==0 && player_not_locked_down()
	{
		var slow_ratio;
		slow_ratio=1
		if mild_slowed_counter>0
			slow_ratio=MILD_SLOW_PERCENTAGE
		if fuckoff_slowed_counter>0
			slow_ratio=FUCKOFF_SLOW_PERCENTAGE
            
            
		if hor_running_counter>0
			hor_running_counter=-HOR_SHUFFLE_THRESHOLD-1
		hor_running_counter-=1
        
		if groundcheck!=noone
		{
			if  hor_running_counter==-HOR_SHUFFLE_THRESHOLD
			hspd=-HOR_SHUFFLESPEED*slow_ratio
			if  hor_running_counter<-HOR_RUNNING_THRESHOLD
			hspd=-HOR_RUNSPEED*slow_ratio
		}
		else
		{
			if hspd>-HOR_AIR_MINSPEED
				hspd=-HOR_AIR_MINSPEED
			if hspd>-HOR_AIR_MAXSPEED
				hspd-=HOR_AIR_ACCEL*slow_ratio
		}
	} 
	//checks if player is allowed to change direction (could be own script)   remember to update for L and R! 
	if player_allow_direction_switch()
	{
		image_xscale=-1
		right=false
	}
	
	if STUNNED2<1 && player_not_locked_down()
	{
		var pass;
		pass=false
		for (i=0; i<ds_list_size(sprites_below_run_priority); i+=1)
		{
			if sprites[sprites_below_run_priority[| i]]==sprite_index
			{
				pass=true
				break;
			}
		};
        
		if pass
		{
			sprite_index=sprites[1]   ///run sprite
			if super_mode
				sprite_index=sprites[8]
			image_speed=FRAME_SPEED_SLOW
		}
	}
}
if checkkey(rightbutton) && (cangroundpound==0 || cangroundpound==3) && (dashcd<DASH_COOLDOWN_TIME-DASH_LOCKDOWN_TIME || dash_wallbreak_forgive==true ) && airgrab_mode!=2 && airgrab_mode!=4 && !uniques_whirlwind_active
{                                                                               /// move RIGHT
	if STUNNED==0 && STUNNED2==0 && player_not_locked_down()
	{
		var slow_ratio;
		slow_ratio=1
		if mild_slowed_counter>0
			slow_ratio=MILD_SLOW_PERCENTAGE
		if fuckoff_slowed_counter>0
			slow_ratio=FUCKOFF_SLOW_PERCENTAGE
            
		if hor_running_counter<0
			hor_running_counter=HOR_SHUFFLE_THRESHOLD+1
		hor_running_counter+=1
        
		if groundcheck!=noone
		{
			if  hor_running_counter==HOR_SHUFFLE_THRESHOLD
				hspd=HOR_SHUFFLESPEED*slow_ratio
			if  hor_running_counter>HOR_RUNNING_THRESHOLD
				hspd=HOR_RUNSPEED*slow_ratio
		}
		else
		{
			if hspd<HOR_AIR_MINSPEED
				hspd=HOR_AIR_MINSPEED
			if hspd<HOR_AIR_MAXSPEED
				hspd+=HOR_AIR_ACCEL*slow_ratio
		}
	}
	if player_allow_direction_switch()
	{
		image_xscale=1
		right=true
	}
	if STUNNED2<1 && player_not_locked_down()
	{
		var pass;
		pass=false
		for (i=0; i<ds_list_size(sprites_below_run_priority); i+=1)
		{
			if sprites[sprites_below_run_priority[| i]]==sprite_index
			{
				pass=true
				break;
			}
		};
        
		if pass
		{
			sprite_index=sprites[1]    ///run sprite
			if super_mode
				sprite_index=sprites[8]
			image_speed=FRAME_SPEED_SLOW
		}
	} 
}
if (!checkkey(leftbutton) && !checkkey(rightbutton)) && hspd==0
{
	hor_running_counter=0
}
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
                                                    /* JUMP EVENT *///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
if STUNNED2<1 && player_not_locked_down() && airgrab_mode!=2 && airgrab_mode!=4 && cripple_debuff_counter<1 
{
	var set_jump_sprites;
	set_jump_sprites=false  
    
	if checkkey_pushed(upbutton)
	{
		var exception;
		exception=false

		if !exception
		{
			if (      (doublejump==0)   ||  (doublejumptimer>0 && doublejump==1)    )   //// if you push up and either its your first jump, or the timer for double jump is ok
			{
				if (groundcheck!=noone || ltt>0) || doublejump==1  /// 'all checks cleared' for jump.  (on ground or looneytunesing , or use up double jump)
				{////single or double jump
					jumped=true  
					alarm[3]=GROUNDPOUND_UNAVAILABLE_TIME      ///ground pound unavailable time (after jump)
					cangroundpound=-1
        
					if doublejump==0     ////single jump
					{
						rocket_jump_input_time_counter_from_jump=ROCKET_JUMP_INPUT_TIME_ALLOWED_FROM_JUMP
						doublejumptimer=DOUBLEJUMPTIME
						vspd=-JUMPSPEED*wateryjump
					}
					if doublejump==1     ///double jump
					{
						effect_aniend(whooshbigjump,0.2,-2)
						vspd=-DOUBLEJUMPSPEED*wateryjump 
					}
					set_jump_sprites=true         
				}
                
				doublejump+=1    ///bizzarely, increment doublejump variable whether or not you jumped. [finaledit] probs should be in above brackets
			}
			///////////VETERAN PARACHUTE
			if doublejump==2 && uniques_parachute_enabled==true && uniques_parachute==0 && set_jump_sprites==false
			{
				uniques_parachute=1
				uniques_parachute_minimum_time_counter=UNIQUES_PARACHUTE_MINIMUM_TIME
				doublejump=3
				vspd=vspd/1.5
				set_jump_sprites=true 
			}
		}
	}
    
	if set_jump_sprites==true   ///do sprites at end
	{
		sprite_index=sprites[2]    ///jump windup sprite
		if super_mode
			sprite_index=sprites[10]
		image_speed=FRAME_SPEED_FAST
		image_index=0
	}
}

if uniques_parachute==1     ////parachute floating effect
{
	if vspd>UNIQUES_PARACHUTE_FALL_SPEED
		vspd=UNIQUES_PARACHUTE_FALL_SPEED
	if sprite_index==sprites[4]  ///fall sprite
		sprite_index=sprites[64] ///parachute sprite
	if sprite_index==sprites[12] ///fall super sprite
		sprite_index=sprites[65] ///parachute super sprite
	if !checkkey(upbutton)        ////release parachute
	{
		uniques_parachute=2
		if sprite_index==sprites[64] || sprite_index==sprites[65]
		{
			sprite_index=sprites[4]  //fall sprite
			if super_mode
				sprite_index=sprites[12] //fall super sprite       
		}        
	}
}

player_falldown_sprite_check()

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/* movement engine (and charge-up movements and room ceiling death check)*/
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

///////////////////////////////////////////////////////////////////////////////////////////////////////////// HORIZONTAL MOVEMENT


if hspd>0
{
	for (i=0; i<hspd; i+=1)
	{
		if !place_meeting(x+1,y,block) && x<kouchou.room_right_border_x-20 && (chained_debuff_counter<1 || (x-chained_debuff_x_pos<BAITCHAIN_CHAIN_RANGE))
			x+=1
		else
			break;
	};
}
else if hspd<0
{
	for (i=0; i<-hspd; i+=1)
	{
		if !place_meeting(x-1,y,block) && x>kouchou.room_left_border_x+20 && (chained_debuff_counter<1 || (chained_debuff_x_pos-x<BAITCHAIN_CHAIN_RANGE))
			x-=1
		else
			break;
	};
}
if uniques_whirlwind_active    ////[finaledit] checking every step, probably can be optimized
{
	if (   x - (kouchou.room_left_border_x+20) <2 ) ||  (   (kouchou.room_right_border_x-20) - x   )<2
	{
		uniques_whirlwind_active=false
		player_flush_lockdowns()
	}
}

////////////// CHARGE ATTACKS/MOVEMENTS AND ANIMATION LOOP
attack_shooting_animation_checks()




//LIMIT VSPD
if vspd>10 && cangroundpound!=2 && airgrab_mode!=4
	vspd=10
//VERTICAL MOVEMENT
if vspd>0
{
	for (i=0; i<vspd; i+=1)
	{
		if !place_meeting(x,y+1,block) && (chained_debuff_counter<1 || (y-chained_debuff_y_pos<BAITCHAIN_CHAIN_RANGE)) ///don't replace this with groundcheck you dumbo
			y+=1
		else
			break;
	};
}
else if vspd<0
{
	if (dash_rocket_top_collision_safety>0 && y<DASH_ROCKET_TOP_COLLISION_MAXY)
	{
		vspd=0
	}
    
	for (i=0; i<-vspd; i+=1)
	{
		if !place_meeting(x,y-1,block) && (chained_debuff_counter<1 || (chained_debuff_y_pos-y<BAITCHAIN_CHAIN_RANGE))
			 y-=1
		else
			break;
	};
}


//[finaledit] make a single block for left and right....... why...
if place_meeting(x-hspd,y,block) && player_not_digging()  /// horizontal block collision left
{
	var bounced;
	bounced=false   ///set to true after bounce effect so you don't bounce left and right at same time
    
	if hspd>0
	{
		if canbounce_counter>0
		{
			bounced=true
			if canbounce_counter>MAX_CANBOUNCE_COUNTER
				canbounce_counter=MAX_CANBOUNCE_COUNTER
			hspd=clamp(-BOUNCE_MIN_VELOCITY,-hspd,-BOUNCE_MAX_VELOCITY)
			//show_message("bounce, go left! hspd is:"+string(hspd))
		}
		for (i=0; i<hspd; i+=1)
		{
			if !place_meeting(x+1,y,block)
				x+=1
			else
				break;
		};
		if bounced==true
		{
			if place_meeting(x-1,y,block)
				x-=1
		}
	}
	if hspd<0
	{
		if canbounce_counter>0 && bounced==false
		{
			bounced=true
			if canbounce_counter>MAX_CANBOUNCE_COUNTER
				canbounce_counter=MAX_CANBOUNCE_COUNTER
			hspd=clamp(BOUNCE_MIN_VELOCITY,-hspd,BOUNCE_MAX_VELOCITY)
			//show_message("bounce, go right! hspd is:"+string(hspd))
    
		}
		for (i=0; i<-hspd; i+=1)
		{
			if !place_meeting(x-1,y,block)
				x-=1
			else
			break;
		};
		if bounced==true
		{
			if place_meeting(x+1,y,block)
				x+=1
		}
	}
	if bounced==false
		hspd=0
    
	if impact_debuff_counter>0
	{
		impact_debuff_counter=0
		create_terrain_cutter(eightysqcircle,"hit",-2,7)     ///if changing this also change for rightward direction
	}
	if uniques_whirlwind_active==true
	{
		uniques_whirlwind_active=false
		get_stunned(UNIQUES_WHIRLWIND_SELFSTUN_AMOUNT,true)
	}
}
else if place_meeting(x+hspd,y,block)  && player_not_digging()  /// horizontal block collision right
{
	var bounced;
	bounced=false

	if hspd>0
	{
		if canbounce_counter>0 && bounced==false
		{
			bounced=true
			if canbounce_counter>MAX_CANBOUNCE_COUNTER
				canbounce_counter=MAX_CANBOUNCE_COUNTER
			hspd=clamp(-BOUNCE_MIN_VELOCITY,-hspd,-BOUNCE_MAX_VELOCITY)
			//show_message("bounce, go left! hspd is:"+string(hspd))
		}
		for (i=0; i<hspd; i+=1)
		{
			if !place_meeting(x+1,y,block)
				x+=1
			else
				break;
		};
		if bounced==true
		{
			if place_meeting(x-1,y,block)
				x-=1
		}
	}
	if hspd<0
	{
		if canbounce_counter>0 && bounced==false
		{
			bounced=true
			if canbounce_counter>MAX_CANBOUNCE_COUNTER
				canbounce_counter=MAX_CANBOUNCE_COUNTER
			hspd=clamp(BOUNCE_MIN_VELOCITY,-hspd,BOUNCE_MAX_VELOCITY)
			//show_message("bounce, go right! hspd is:"+string(hspd))
		}
		for (i=0; i<-hspd; i+=1)
		{
			if !place_meeting(x-1,y,block)
				x-=1
			else
				break;
		};
		if bounced==true
		{
			if place_meeting(x+1,y,block)
				x+=1
		}
	}
	if bounced==false
		hspd=0 
        
	if impact_debuff_counter>0
	{
		impact_debuff_counter=0 
		create_terrain_cutter(eightysqcircle,"hit",-2,7)     ///if changing this also change for leftward direction
	}
	
	if uniques_whirlwind_active==true
	{
		uniques_whirlwind_active=false
		get_stunned(UNIQUES_WHIRLWIND_SELFSTUN_AMOUNT,true)
	}
}




///////////////////////////////////////////////////////////////////////////////////////////////// HORIZONTAL FRICTION AND HSPD LIMIT
if canbounce_counter<1   ///disable horizontal friction if bouncing
{
	if ( (!checkkey(leftbutton) && !checkkey(rightbutton) ) || !player_not_locked_down()  )          //     horizontal friction     if not holding left nor right, 
	{ 
		var fir;
		fir=FRICTION
		if groundcheck==noone
			fir=AIR_FRICTION
		if !player_not_locked_down()
		{
			fir/=3
		}
		if hspd>0
		{
			hspd-=fir
			if hspd<0    ///sets to 0 instead of going negative
			hpsd=0
		}
		if hspd<0 
		{
			hspd+=fir
			if hspd>0    ///sets to 0 instead of going negative
			hspd=0
		}    
	}
	else                                                ///                                     else limit hspd if running 
	{
		var fir;
		fir=FRICTION
		if hspd>RUNNING_HSPD_MAX
		{
			hspd-=fir
			if hspd<0    ///sets to 0 instead of going negative
				hpsd=0
		}
		if hspd<-RUNNING_HSPD_MAX
		{
			hspd+=fir
			if hspd>0    ///sets to 0 instead of going negative
				hspd=0
		}
	}
}


if  uniques_vet_digging==2
{
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

//////////////////////////////////////////////////////////////////////////////////////////////////////// TOP SCREEN DEATH
if y<-10
{
	if dash_rocket_top_collision_safety<1
		playerdie()
}


////end step stuff
groundcheck_prev=groundcheck