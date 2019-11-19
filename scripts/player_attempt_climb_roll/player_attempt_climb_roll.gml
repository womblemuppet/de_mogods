var check_result,roll_completed;
roll_completed=false

if right
	check_result=player_check_climb_roll_spacing("right")
else
	check_result=player_check_climb_roll_spacing("left")
			
if check_result!="do_not_roll"
{
	roll_completed=true
	show_debug_message(check_result)
	vspd=CLIMB_ROLL_1_BLOCK_VSPD
	sprite_index=sprites[? "climb"]
	image_index=0
	image_speed=FRAME_SPEED_NORMAL
}

return roll_completed