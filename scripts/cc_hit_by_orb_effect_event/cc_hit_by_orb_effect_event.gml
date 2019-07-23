var victim = argument0

with combo_text_controller
{
	if !instance_exists(victim)
	exit
	
	if last_got_hit_by[victim.P]==noone
	exit
	
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