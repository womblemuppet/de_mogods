//////////////////////////   LAVA COLLISION   ///////////////////////////////////
if hit==true
exit

var lowest,lowesty;
lowest=noone
lowesty=-100


///finds lowest player below lava line (random if tied)
for (var i = 0; i < instance_number(player);i++)
{
	with instance_find(player,i)
	{
		if y>lava_level.y-50 && y>=lowesty
		{
			if y>lowesty || (y==lowesty && choose(0,1)==1)
			{
				lowest=self.id
				lowesty=y
			}
		}
	}
}

///lava damage event
if lowest!=noone
{
	with lowest
	{
		losehp("lava")
		effect_aniend(splash_effect1,0.2,-1)
	}
		
	
	hit=true
	alarm[1]=30
}
//////////////////////////////////////////////////////////////////