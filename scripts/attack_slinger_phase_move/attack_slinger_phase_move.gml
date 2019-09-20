if uniques_phase_target!=noone
{
	if instance_exists(uniques_phase_target)
	{
		var phasing_dir_sign,tx,ty;
		tx=uniques_phase_target.x
		ty=uniques_phase_target.y
		
		phasing_dir_sign=1
		if x<=tx
			phasing_dir_sign=-1
		
		var offset_step_amount;
		offset_step_amount=10*phasing_dir_sign
		
		for (var last_accepted_offset_factor = -3; last_accepted_offset_factor < 6; last_accepted_offset_factor++)
		{
			if place_meeting(tx+last_accepted_offset_factor*offset_step_amount,ty,block) || x<=kouchou.room_left_border_x+HORIZONTAL_BOUNDARY_WIDTH || x >= kouchou.room_right_border_x-HORIZONTAL_BOUNDARY_WIDTH
				break;
		}
		
		if last_accepted_offset_factor!=-3
		{
			x=tx+last_accepted_offset_factor*offset_step_amount
			y=ty
		}
		show_debug_message("last_accepted_offset_factor="+string(last_accepted_offset_factor))
	}
}

attack_slinger_phase_cancelled()




