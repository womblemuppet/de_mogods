if float_counter<1   ///disable horizontal friction if floating
{
	if ( (!checkkey(leftbutton) && !checkkey(rightbutton) ) || !player_not_locked_down()  )          //     horizontal friction     if not holding left nor right, 
	{              ////disable horizontal friction if player is holding a button or is locked down
		var fir;
		fir=FRICTION
		
		if groundcheck==noone
			fir=AIR_FRICTION
			
		if canbounce_counter>0   ///be more slidey if bouncing
			fir/=2
		//if !player_not_locked_down()   ///if player locked down, third the friction
		//{
		//	fir/=3
		//}
		
		if hspd>0
		{
			hspd-=fir
			if hspd<0    ///sets to 0 instead of going negative
				hspd=0
		}
		if hspd<0 
		{
			hspd+=fir
			if hspd>0    ///sets to 0 instead of going negative
				hspd=0
		}    
	}
	else                                                ///                                     else limit hspd if running or locked down?
	{
		var fir;
		fir=FRICTION
		if hspd>RUNNING_HSPD_MAX
		{
			hspd-=fir
			if hspd<0    ///sets to 0 instead of going negative
				hspd=0
		}
		if hspd<-RUNNING_HSPD_MAX
		{
			hspd+=fir
			if hspd>0    ///sets to 0 instead of going negative
				hspd=0
		}
	}
}
