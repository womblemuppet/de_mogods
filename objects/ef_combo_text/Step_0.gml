if fading
{
	if x<xstart+START_MOVE_RIGHT_AMOUNT+END_MOVE_RIGHT_AMOUNT
		x+=3
	else
		instance_destroy()
}
else
{
	if x<xstart+START_MOVE_RIGHT_AMOUNT
		x+=3
}