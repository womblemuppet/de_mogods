if instance_exists(targ)
{
	x=targ.x
}
if fading
{
	image_alpha-=0.1
	if image_alpha<0.1
		instance_destroy()
}

if y>30
	y-=3