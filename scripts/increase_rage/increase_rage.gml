//add rage
with aizen
{
	rage+=argument0
	
	
	if rage > RAGE_RITUAL_LEVEL
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