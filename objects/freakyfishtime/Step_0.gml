var lowest,lowesty;
lowest=noone
lowesty=-100

with player
{
	if y>freakyfishtime.y-50 && y>=lowesty
	{
		if y>lowesty || (y==lowesty && choose(0,1)==1)  //[finaledit] untested...
		{
			lowest=self.id
			lowesty=y
		}
            
	}   
}


if lowest!=noone
{
	with lowest
		losehp(false,"lava")
		
	effect_aniend(splash_effect1,0.2,-1)
	
}