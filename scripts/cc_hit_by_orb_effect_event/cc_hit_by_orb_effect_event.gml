var victim = argument0

with combo_text_controller
{
	show_message("player hit by orb effect test, victim.P = "+string(victim.P)+" lastgothittimer = "+string(last_got_hit_timer[victim.P])+" lastgothitby = "+string(last_got_hit_by[victim.P]))
	if !instance_exists(victim)
	exit
	
	if last_got_hit_by[victim.P]==noone
	exit
	
	var attacker = last_got_hit_by[victim.P];
	
	
	if last_got_hit_timer[victim.P]>VOLLEY_CUTOFF_TIME
	{
		show_debug_message("volleyed")
		[continue] put these lines into the effect_combo_text function
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