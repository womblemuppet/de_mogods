if (argument0=="left" && hspd>0) || (argument0=="right" && hspd<0)
{
	var sgn;
	sgn=1
	if argument0=="left"
		sgn=-1
	var bounced;
	bounced=false   ///set to true after bounce effect happens so you don't bounce left and right at same time

	if canbounce_counter>0
	{
		bounced=true
		if canbounce_counter>MAX_CANBOUNCE_COUNTER
			canbounce_counter=MAX_CANBOUNCE_COUNTER
		if abs(hspd)<1
			hspd=0
		else
			hspd=sgn*BOUNCE_MAX_VELOCITY
		//hspd=clamp(sgn*BOUNCE_MIN_VELOCITY,sgn*hspd,sgn*BOUNCE_MAX_VELOCITY)
		//show_message("bounce, go left! hspd is:"+string(hspd))
	}
	for (i=0; i<abs(hspd); i+=1)
	{
		if !place_meeting(x-sgn,y,block)
			x-=sgn
		else
			break;
	};
	if bounced==true
	{
		if place_meeting(x+sgn,y,block)
			x+=sgn
	}

	if bounced==false
		hspd=0
}