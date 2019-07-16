repeat(4)    ////[finaledit] spam loads of effects to lag the game down
{
	a=effect_aniend(tunnel_effect1,0.2,-1)
	a.y-=random(HEIGHT)
	var ceb;
	ceb=WIDTH/2
	a.x+=ceb-(   random(ceb*2)   )       
	a.vspeed=choose(-0.5,-1.5)
	a.gravity_direction=90
	a.gravity=0.2
}
repeat(3)    
{
	a=effect_aniend(tunnel_effect1,0.2,-1)
	a.y-=(SPLITDISTANCE+random(y-SPLITDISTANCE))
	var ceb;
	ceb=(WIDTH/2)+40+GIRTH/(y-SPLITDISTANCE)*((y-SPLITDISTANCE)-a.y)///40 is a little overlap to hide the illumination lines  
	a.x+=ceb-(   random(ceb*2)   )        
	a.vspeed=choose(-0.5,-1.5)
	a.gravity_direction=90
	a.gravity=0.2
}

