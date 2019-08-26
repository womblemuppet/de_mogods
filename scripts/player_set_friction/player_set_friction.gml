if canbounce_counter<1 && float_counter<1   ///disable horizontal friction if bouncing or floating
{
	if ( (!checkkey(leftbutton) && !checkkey(rightbutton) ) || !player_not_locked_down()  )          //     horizontal friction     if not holding left nor right, 
	{ 
		var fir;
		fir=FRICTION
		if groundcheck==noone
			fir=AIR_FRICTION
		if !player_not_locked_down()
		{
			fir/=3
		}
		if hspd>0
		{
			hspd-=fir
			if hspd<0    ///sets to 0 instead of going negative
				hpsd=0
		}
		if hspd<0 
		{
			hspd+=fir
			if hspd>0    ///sets to 0 instead of going negative
				hspd=0
		}    
	}
	else                                                ///                                     else limit hspd if running 
	{
		var fir;
		fir=FRICTION
		if hspd>RUNNING_HSPD_MAX
		{
			hspd-=fir
			if hspd<0    ///sets to 0 instead of going negative
				hpsd=0
		}
		if hspd<-RUNNING_HSPD_MAX
		{
			hspd+=fir
			if hspd>0    ///sets to 0 instead of going negative
				hspd=0
		}
	}
}
