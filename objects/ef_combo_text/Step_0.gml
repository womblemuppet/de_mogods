if fading
{
	y-=4
	if y<ystart-40
		instance_destroy()
}

if moveleft>1
{
	moveleft-=3
	x+=3
}