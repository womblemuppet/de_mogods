with combo_text_controller
{
	if last_got_hit_timer[argument0]>CUCKED_CUTOFF_TIME
	{
		show_debug_message("cucked")
		effect_combo_text(self.id,"cucked",last_got_hit_by[argument0])
	}
	
}