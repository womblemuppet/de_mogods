/*
  player_set_horizontal_movement
  changes player direction and sets/increases hspd
*/

var sgn;

if argument0=="left"
	sgn=-1
else
	sgn=1
	

//increase movespeed if allowed to run
if stunned==0 && player_not_locked_down()
{
	var slow_ratio;
	slow_ratio=1
	if mild_slowed_counter>0
		slow_ratio=MILD_SLOW_PERCENTAGE
	if brutal_slowed_counter>0
		slow_ratio=BRUTAL_SLOW_PERCENTAGE


	if (argument0=="left" && hor_running_counter>0) || (argument0=="right" && hor_running_counter<0)
		hor_running_counter=(sgn*HOR_SHUFFLE_THRESHOLD)+sgn

	hor_running_counter+=sgn


	if groundcheck!=noone
	{
		if hor_running_counter==sgn*HOR_SHUFFLE_THRESHOLD
			hspd=sgn*HOR_SHUFFLESPEED*slow_ratio
		if (argument0=="left" && hor_running_counter<-HOR_RUNNING_THRESHOLD) || (argument0=="right" && hor_running_counter>HOR_RUNNING_THRESHOLD)
			hspd=sgn*HOR_RUNSPEED*slow_ratio
	}
	else
	{
		if (argument0=="left" && hspd>-HOR_AIR_MINSPEED) || (argument0=="right" && hspd<HOR_AIR_MINSPEED)
			hspd=sgn*HOR_AIR_MINSPEED
		if (argument0=="left" && hspd>-HOR_AIR_MAXSPEED) || (argument0=="right" && hspd<HOR_AIR_MAXSPEED)
			hspd+=sgn*HOR_AIR_ACCEL*slow_ratio
	}
} 
	
//checks if player is allowed to change direction
if player_allow_direction_switch()
{
	image_xscale=sgn*scale
	if argument0=="left"
		right=false
	else
		right=true	
}

///update sprite to running 
if player_not_locked_down()
{
	var pass;
	pass=false
	for (var i=0; i<ds_list_size(sprites_below_run_priority); i+=1)
	{
		if ds_map_find_value(sprites,sprites_below_run_priority[| i])==sprite_index
		{
			pass=true
			break;
		}
	};
        
	if pass
	{
		sprite_index=sprites[? "run"]   
		if super_mode_available
			sprite_index=sprites[? "run_u"]
		image_speed=FRAME_SPEED_SLOW
	}
}
