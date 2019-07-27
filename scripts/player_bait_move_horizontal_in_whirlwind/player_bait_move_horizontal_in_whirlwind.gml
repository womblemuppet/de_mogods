if uniques_whirlwind_active    ////[finaledit] checking every step, probably can be optimized
{
	if (   x - (kouchou.room_left_border_x+20) <2 ) ||  (   (kouchou.room_right_border_x-20) - x   )<2
	{
		uniques_whirlwind_active=false
		player_flush_lockdowns()
	}
}