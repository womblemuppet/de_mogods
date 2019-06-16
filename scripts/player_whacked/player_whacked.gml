/*
0 stun amount
1 number of hh
2 whether to reset attacker's hh (so false for ranged attacks)
3 whether to reset or not
4 whether to gain meter or not
*/

STUNNED=argument0
                 ///////////get stunned


other.hit[P]=true
if other.hit_collector!=noone
{
	if instance_exists(other.hit_collector)
		other.hit_collector.hit[P]=true
}
if !instance_exists(payday)            ////////add to hothands (if not payday)
{
	hothands+=argument1
	if argument2!=0     //whether to reset hh (melee/ranged)
		other.creator.hothands=0
}
if dash_rocket_jump==1   ///if hit during rocket jump charge, get crippled
{
	cripple_debuff_counter=dash_rocket_jump_VUNERABLE_CRIPPLE_AMOUNT
}

player_flinch()
player_hothands_check()

if argument3     /// knocks player out of current animation
{
	player_flush_lockdowns()
}




if argument4    ///gain meter
{
	with other.creator
	{
		super_meter+=1
		aizen.player_meter[P]+=1
		if super_meter>aizen.SUPER_METER_AMOUNT
		{
			super_meter=0
			aizen.player_meter[P]=0
			player_get_ult()
		}
	}
}


///delete dash hitbox
if dash_current_hitbox_object!=noone
{
	if instance_exists(dash_current_hitbox_object)
		with dash_current_hitbox_object
			instance_destroy()
}