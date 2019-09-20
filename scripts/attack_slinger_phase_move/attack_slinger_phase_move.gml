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
		
		
		
		///////////////////clamp factor_start and factor_end to inside the room boundaries if needed
		var factor_start,factor_end;
		factor_start=-3
		factor_end=6

		var test_tx;
		test_tx=tx+factor_start*offset_step_amount
			
		if test_tx<kouchou.room_left_border_x+HORIZONTAL_BOUNDARY_WIDTH || test_tx>kouchou.room_right_border_x-HORIZONTAL_BOUNDARY_WIDTH	
			factor_start=-1
			
		test_tx=tx+factor_end*offset_step_amount
		
		if test_tx<kouchou.room_left_border_x+HORIZONTAL_BOUNDARY_WIDTH || test_tx>kouchou.room_right_border_x-HORIZONTAL_BOUNDARY_WIDTH	
			factor_start=4
		
		///////////////////find best place to teleport to by trying closer to best place each time, failing on collision
		for (var last_accepted_offset_factor = factor_start; last_accepted_offset_factor < factor_end; last_accepted_offset_factor++)
		{
			if place_meeting(tx+last_accepted_offset_factor*offset_step_amount,ty,block) 
				break;
		}
		
		if last_accepted_offset_factor!=factor_start
		{
			x=tx+last_accepted_offset_factor*offset_step_amount
			y=ty
		}
		show_debug_message("last_accepted_offset_factor="+string(last_accepted_offset_factor))
	}
}

attack_slinger_phase_cancelled()




