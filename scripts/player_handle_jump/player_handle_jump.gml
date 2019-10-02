//////////////* JUMP EVENT *///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
if stunned_groundpound<1 && player_not_locked_down() && cripple_debuff_counter<1 
{
	var set_jump_sprites;
	set_jump_sprites=false  
    
	if checkkey_pushed(upbutton) && !place_meeting(x,y-10,block)
	{
		var exception;
		exception=false  ///[finaledit not in use

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
						vspd=-JUMPSPEED*water_jump_factor
					}
					if doublejump==1     ///double jump
					{
						effect_aniend(player_double_jump_effect_spr,0.2,-2)
						vspd=-DOUBLEJUMPSPEED*water_jump_factor 
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
		sprite_index=sprites[? "jump"]    ///jump windup sprite
		if super_mode
			sprite_index=sprites[? "jump_u"]
		image_speed=FRAME_SPEED_FAST
		image_index=0
	}
}
