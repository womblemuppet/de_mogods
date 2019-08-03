var sgn,stepdist,steps;
steps=8

if argument0=="up"
{
	sgn=-1
	doublejump=1
	doublejumptimer=DOUBLEJUMPTIME
	stepdist=floor(UNIQUES_SLINGER_PHASE_UP_DISTANCE/steps)
}
else if argument0=="down"
{
	vspd=0
	sgn=1
	stepdist=floor(UNIQUES_SLINGER_PHASE_DOWN_DISTANCE/steps)
}
else
	show_error("phase mv unknown dir string",true);




attack_slinger_phase_cancelled()


repeat(steps)
{
	if !place_meeting(x,y+sgn*stepdist,block)
	{
		y+=sgn*stepdist
		effect_aniend(spr_slinger_reset_jump,0.2,-1)
	}
	else
		continue;
}



