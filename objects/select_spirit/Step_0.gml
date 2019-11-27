var SPD;
SPD=7

if moving=="left"
{
	if x>xtarget
	{
		x-=SPD
		if x<=xtarget
		{
			x=xtarget
			moving="no"
			sprite_index=NORMAL_SPRITE
		}		
	}
}
else if moving=="right"
{
	if x<xtarget
	{
		x+=SPD
		if x>=xtarget
		{
			x=xtarget
			moving="no"
			sprite_index=NORMAL_SPRITE
		}		
	}
}