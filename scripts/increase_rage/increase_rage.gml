//add rage
with aizen
{
	//add rage
	rage+=argument0
	
	//update can_ritual
	if rage >= RAGE_RITUAL_LEVEL
		can_ritual=true
	else
		can_ritual=false

	if aizen.rage<RAGE_TRIGGER_AMOUNT
		HUD_increment_rage_bar(1)
	else
	{
		start_shitcall()
		rage=0
		HUD_reset_rage_bar()
	}
}