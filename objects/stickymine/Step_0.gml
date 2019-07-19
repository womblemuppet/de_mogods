if instance_exists(targ)
{
	x=targ.x
	y=targ.y
}
if triggered
{
	delaycounter-=1
	if delaycounter<1
		instance_destroy()
}