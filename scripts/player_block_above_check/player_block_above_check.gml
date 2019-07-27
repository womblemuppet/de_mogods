if vspd<0
{
	if place_meeting(x,y-1,block) /// vertical block collision above
	{
		vspd=0
	}
}