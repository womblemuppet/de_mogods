var victim = argument0

with combo_text_controller
{
	if !instance_exists(victim)
	exit

	if last_got_hit_by[victim.P]==noone || last_got_hit_by[victim.P]==undefined
	exit

	show_debug_message("player hit by orb effect test, victim.P = "+string(victim.P)+" lastgothittimer = "+string(last_got_hit_timer[victim.P])+" lastgothitby = "+string(last_got_hit_by[victim.P])+"last_got_hit_by[victim.P].hh = "+string(last_got_hit_by[victim.P].hothands))

	var attacker = last_got_hit_by[victim.P];
	
	
	if last_got_hit_timer[victim.P]>VOLLEY_CUTOFF_TIME
	{
		show_debug_message("volleyed")
		with ef_combo_text
		{
			if targ==attacker
				instance_destroy()
		}
		effect_combo_text(attacker,"volley")
		
	}
	
	if last_got_hit_timer[victim.P]>CUCKED_CUTOFF_GOT_HIT_TIME && last_hit_timer[victim.P]>CUCKED_CUTOFF_HIT_TIME && last_got_hit_by[victim.P].hothands==3
	{
		show_debug_message("cucked")
		
		with ef_combo_text
		{
			if targ==victim
				instance_destroy()
		}
		effect_combo_text(victim,"cucked")
		
	}
	
}