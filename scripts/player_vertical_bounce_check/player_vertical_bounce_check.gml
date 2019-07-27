if canbounce_counter>0 && abs(hspd)>4 && abs(vspd)>6   //if bounce enabled, and will hit block below, reverse vspd and move player up one pixel. must happen before groundcheck
{
	if place_meeting(x,y+vspd,block)      /////    bounce upward
	{
		if canbounce_counter>MAX_CANBOUNCE_COUNTER
			canbounce_counter=MAX_CANBOUNCE_COUNTER
		vspd=-BOUNCE_VERTICAL_VELOCITY
		if !place_meeting(x,y-1,block)
			y-=1
	}
}
