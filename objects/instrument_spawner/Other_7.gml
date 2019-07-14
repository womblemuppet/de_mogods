if sprite_index==block_bubbler_end_spr
{
	dont_trigger_reset=true
	if instance_exists(targ)
	{
		with targ
		{
			spawn_instrument_block(x,y,true)
			instance_destroy()
		}
	}
	instance_destroy()
}