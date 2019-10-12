if fading
{
	image_alpha-=0.1
	if image_alpha<0.1
		instance_destroy()
}

if moveleft>1
{
	moveleft-=3
	x+=3
}