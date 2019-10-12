var victim=argument0
var attacker=argument1

with combo_text_controller
{
	last_got_hit_timer[victim.P]=TIMER_START
	last_got_hit_by[victim.P]=attacker
	last_hit_timer[attacker.P]=TIMER_START
	combo_hit_count[attacker.P]+=1
	
	if combo_hit_count[attacker.P]>1
	{
		with ef_combo_text
		{
			if targ==attacker
				instance_destroy()
		}
		effect_combo_text(attacker,"combo")
	}

}