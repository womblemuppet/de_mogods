if spawn_windup_effects
{
	a=effect_aniend(spiralpower_base,0.05,-1)
	a.vspeed=-0.5
	a.gravity_direction=90
	a.x+=2*(WIDTH/3)-(random(WIDTH/3)*4)
	a.y-=random(HEIGHT)  
	a.gravity=0.1
}
if active
{
	repeat(2)    ////[finaledit] spam loads of effects to lag the game down
	{
		a=effect_aniend(tunnel_effect1,0.2,-1)
		a.y-=MAX_HEIGHT+random(height)
		
		var ceb;
		ceb=WIDTH/2
		
		a.x+=ceb-(   random(ceb*2)   )       
		a.vspeed=choose(-0.5,-1.5)
		a.gravity_direction=90
		a.gravity=0.2
	}
}