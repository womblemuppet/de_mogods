/*
0 stun amount
1 number of hh
2 whether to reset attacker's hh (so false for ranged attacks)
3 whether to reset or not
*/

var arg_stun_amount,arg_number_of_hh,arg_reset_attackers_hh,arg_reset_opp;
arg_stun_amount=argument0
arg_number_of_hh=argument1
arg_reset_attackers_hh=argument2
arg_reset_opp=argument3

last_hit_knocked_down=false

audio_play_sound(bam,5,false)

if armouredsteps<1
	stunned=arg_stun_amount

var attacker;
if instance_exists(other.creator) || other.creator==noone
	attacker=other.creator
else
	attacker="does_not_exist"

if instance_exists(payday)==false           ////////add to hothands and do first blood (if not payday)
{
	///do the damage
	hothands+=arg_number_of_hh
	
	///register the hit
	if attacker!="does_not_exist"
	{
		show_debug_message(other.object_index)
		//add to combo count
		if attacker!=noone
			cc_land_hit(self.id,attacker)
		else
			cc_land_hit(self.id,other.combo_hit_pseudo_creator)
		
		//reset hh if attacker exists and isn't self (noone)
		if attacker!=noone && arg_reset_attackers_hh!=0 
			attacker.hothands=0
	}

}
if dash_rocket_jump==1   ///if hit during rocket jump charge, get crippled
	cripple_debuff_counter=dash_rocket_jump_VUNERABLE_CRIPPLE_AMOUNT


player_flinch(arg_stun_amount)
player_has_taken_hh_damage()

if !last_hit_knocked_down  ///if didn't lose hp
{
	if arg_reset_opp     /// knocks player out of current animation
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
attack_clear_groundpound_current_hitbox_object()
