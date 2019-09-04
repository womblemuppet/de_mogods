var sgn;
sgn=1
if argument0=="left"
	sgn=-1

//if you collide with a wall
if (argument0=="left" && place_meeting(x+hspd,y,block)) || (argument0=="right" && place_meeting(x+hspd,y,block))
{
	///if you have momentum torwards that wall
	if (argument0=="left" && hspd<0) || (argument0=="right" && hspd>0)
	{
		var bounced;
		bounced=false   ///set to true after bounce effect happens so you don't bounce left and right at same time
		
		//bounce
		if canbounce_counter>0
		{
			bounced=true
			canbounce_counter=0
			canbounce_show_bounced_effect_counter=CANBOUNCE_SHOW_BOUNCED_EFFECT_TIME
			if abs(hspd)<1
				hspd=-sgn*BOUNCE_HORIZONTAL_MINOR_VELOCITY
			else
				hspd=-sgn*BOUNCE_HORIZONTAL_VELOCITY
		}


		//move right next to wall
		for (var i=0; i<abs(hspd); i+=1)
		{
			if !place_meeting(x-sgn,y,block)
				x-=sgn
			else
				break;
		};
		
		//if bounced, move 1 px away from wall so bounce works
		if bounced==true
		{
			vspd=-2
			if place_meeting(x+sgn,y,block)
			{
				x+=sgn
			}
		}
		else
			hspd=0

		if impact_debuff_counter>0
		{
			impact_debuff_counter=0
			create_terrain_cutter(eightysqcircle,"hit",-2,7)     ///if changing this also change for rightward direction
		}
	}
	if uniques_whirlwind_active==true
	{
		attack_bait_whirlwind_selfstun()
	}
}
