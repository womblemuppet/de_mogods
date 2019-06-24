var d
d=find_a_diggable_block()
if d>0
{
	with d
	{
		spawn_instrument_block(x,y)
		instance_destroy()
	}
}
else
{
	show_debug_message("failed to find a diggable block. return = "+string(d))
}

