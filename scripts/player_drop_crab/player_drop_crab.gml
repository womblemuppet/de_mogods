if crab_being_held!=noone
{
	if instance_exists(crab_being_held)
	{
		//reset crab and set crabs owner to noone
		with crab_being_held
		{
			owner=noone
			sprite_index=stand_sprite
			image_index=0
			breaking=true
			alarm[0]=STEPTIME
		}
		
		//make crab face same direction as player and make crab look the right way
		crab_being_held.right=right
		if right
			crab_being_held.image_xscale=1
		else
			crab_being_held.image_xscale=-1
		
		//reset player variables relating to crab
		crab_being_thrown_corpse_sprite_on_interrupt=undefined
		holding_a_crab=false
		crab_being_held=noone
		
		//swap sprite to not-holding version
		if sprite_index==sprites[? "idle_holding"]
			sprite_index=sprites[? "idle"]
		if sprite_index==sprites[? "run_holding"]
			sprite_index=sprites[? "run"]
		if sprite_index==sprites[? "idle_holding_u"]
			sprite_index=sprites[? "idle_u"]
		if sprite_index==sprites[? "run_holding_u"]
			sprite_index=sprites[? "run_u"]		
		
	}
}   
