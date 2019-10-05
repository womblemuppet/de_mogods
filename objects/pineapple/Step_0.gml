if cooldown>-1
	cooldown-=1   

if samepersoncooldown>-1
	samepersoncooldown-=1

if place_meeting(x,y+1,block) && timer>-500  //hit ground and not dying
{
	sprite_index=pineapple_chilling
}
timer-=1

if timer<1 && timer>-500
{
	if owner==-1
	{
		image_index=0
		image_speed=0.25
		sprite_index=pineapple_despawn
		timer=-501
		cooldown=9999
	}   
	else
	{      ////////being eaten
		with owner
		{
			hothands=0
			if H<aizen.healthcap
				H+=1
		}
		instance_destroy()
	}
    
}
if owner!=-1              ///// if being held
{
	if instance_exists(owner)
	{
		x=owner.x+14*owner.image_xscale
		y=owner.y+4
	}
}
else               //////// if not being held
{
	if !place_meeting(x,y+1,block)
	{
		vspd+=1   ///gravity
	}
	if place_meeting(x,y+1,block)
		vspd=0
	if place_meeting(x,y-1,block)
	{
		vspd=1
	}
    
    
	if vspd>8
		vspd=8
	if vspd<-18
		vspd=-18
        
	if vspd>0
	{
		repeat(vspd)
		{
			if !place_meeting(x,y+1,block)
			{
			              y+=1
			}
		}
	}
    
        
	if vspd<0
	{
		repeat(-vspd)
		{
			if !place_meeting(x,y-1,block)
			{
				y-=1
			}
		}
	}
}

