if uniques_whirlwind_active    ////[finaledit] checking every step, probably can be optimized
{
	if ( x - (kouchou.room_left_border_x+HORIZONTAL_BOUNDARY_WIDTH)) <2 ||  ( kouchou.room_right_border_x-HORIZONTAL_BOUNDARY_WIDTH - x   )<2
	{
		attack_bait_whirlwind_selfstun()
		uniques_whirlwind_active=false
		player_flush_lockdowns()
	}
}