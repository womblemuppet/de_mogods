var sgn,stepdist,steps;
steps=8

if argument0=="up"
{
	sgn=-1
	doublejump=1
	doublejumptimer=DOUBLEJUMPTIME
	stepdist=floor(UNIQUES_SLINGER_PHASE_UP_DISTANCE/steps)
	float_counter=5
}
else if argument0=="down"
{
	vspd=0 ///if falling, set vspd to 0
	sgn=1
	stepdist=floor(UNIQUES_SLINGER_PHASE_DOWN_DISTANCE/steps)
}
else
	show_error("phase mv unknown dir string",true);

if uniques_sunblast_lockdown=0
{
	if right
	{
		if !place_meeting(x+4,y,block)
			x+=4
		hspd=max(hspd,10)  //set hspd to 7 if not that fast
	}
	else
	{
		if !place_meeting(x-4,y,block)
			x-=4
		hspd=min(hspd,-10)   ///set hspd to -7 if not that fast
	}
}


attack_slinger_phase_cancelled()


repeat(steps)
{
	if !place_meeting(x,y+sgn*stepdist,block)
	{
		y+=sgn*stepdist
		effect_aniend(spr_slinger_reset_jump,0.2,-1)
	}
	else
		stepdist=round(stepdist/4)
}



