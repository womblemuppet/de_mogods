/*
0 stun amount
1 number of hh
2 whether to reset attacker's hh (so false for ranged attacks)
3 whether to reset or not
4 whether to gain meter or not
*/

stunned=argument0

var attacker
if instance_exists(other.creator)
	attacker=other.creator
else
	attacker=noone

if !instance_exists(payday)            ////////add to hothands and do first blood (if not payday)
{
	hothands+=argument1
	if attacker!=noone
	{
		with attacker
		{
			cc_land_hit()
		}
		cc_reset_clean()
		if argument2!=0 //whether to reset hh (melee/ranged)
			other.creator.hothands=0
	}
	
	if aizen.first_blood_status=="none"
	{
		first_blood_activate_on_me(x,y)
	}
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


///delete dash hitbox
if dash_current_hitbox_object!=noone
{
	if instance_exists(dash_current_hitbox_object)
		with dash_current_hitbox_object
			instance_destroy()
}

//delete groundpound hitbox
attack_stop_gp()
