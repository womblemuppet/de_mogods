//add rage
with aizen
{
	//add rage
	rage+=argument0
	
	//update can_ritual
	if rage >= RAGE_RITUAL_LEVEL
	{
		can_ritual=true
		with top_HUD.bookend_tiki_left
			tiki_bookend_enter_ritual_threshold()
		with top_HUD.bookend_tiki_right
			tiki_bookend_enter_ritual_threshold()
	}
	else
		can_ritual=false

	if aizen.rage<RAGE_TRIGGER_AMOUNT
		HUD_increment_rage_bar(argument0)
	else
	{
		start_shitcall()
		rage=0
		HUD_reset_rage_bar()
	}
}