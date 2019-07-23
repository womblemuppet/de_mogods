var victim=argument0
var attacker=argument1

with combo_text_controller
{
	last_got_hit_timer[victim.P]=TIMER_START
	last_hit_timer[attacker.P]=TIMER_START
	clean_hit_count[attacker.P]+=1
	
	if clean_hit_count[attacker.P]==3
	{
		show_debug_message("C L E A N ! 3")
		effect_combo_text(self.id,"clean",attacker.P)
	}
	if clean_hit_count[attacker.P]==4
	{
		show_debug_message("C L E A N ! 4")
		with ef_combo_text
		{
			if targ==victim
				instance_destroy()
		}
		effect_combo_text(self.id,"clean4",attacker.P)
	}

}