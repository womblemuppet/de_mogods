combo_text_controller.last_hit_timer[P]=combo_text_controller.CLEAN_MAX_TIME
show_debug_message("CLEAN PLUS 1")
combo_text_controller.clean_hit_count[P]+=1
if combo_text_controller.clean_hit_count[P]==3
{
	show_debug_message("C L E A N ! 3")
	effect_combo_text(self.id,"clean",P)
}
if combo_text_controller.clean_hit_count[P]==4
{
	show_debug_message("C L E A N ! 4")
	var me;
	me=self.id
	with ef_combo_text
	{
		if targ==me
			instance_destroy()
	}
	effect_combo_text(self.id,"clean4",P)
}