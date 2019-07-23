ammo-=1

if ammo>0
{
	var a,meteorsperwave;
	a=0
	meteorsperwave=5   ///per starting wave (the first wave only)
    
	if meteor_wave==0 
	{
		for (var i=0; i<meteorsperwave; i+=1)
		{
			a=instance_create_depth(kouchou.room_left_border_x+50+i*(kouchou.rw/meteorsperwave),-i*50,0,meteor)
			a.hspeed=0.5
		};
		alarm[1]=90
	}
	else if meteor_wave==1  ///lazy
	{
		for (var i=0; i<meteorsperwave; i+=1)
		{
			a=instance_create_depth(kouchou.room_right_border_x-(50+i*(kouchou.rw/meteorsperwave)),-i*50,0,meteor)
			a.hspeed=-0.5
		};
		alarm[1]=90
	}
	else if meteor_wave==2
	{
		a=instance_create_depth(kouchou.room_left_border_x+(random(kouchou.rw)/40)*40,0,0,meteor)
		a.hspeed=-0.5+random(1)
		alarm[1]=30
	}
	meteor_wave=2

}

else
	instance_destroy()

