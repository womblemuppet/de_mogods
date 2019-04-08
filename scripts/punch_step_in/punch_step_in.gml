/***************************************************
    the movement segment of the mini steps that characters do on the animation frames of certain attacks.
    to be called in player step event.   
***************************************************/

if argument0>0
{
	if right==true   /// move right
	{
		for (i=0; i<argument0; i+=1)
		{
			if !place_meeting(x+1,y,block) && x<kouchou.room_right_border_x-20 && place_meeting(x+1,y+1,block)
				x+=1
			else
				break;
		};
	}
	else    //// move left
	{
		for (i=0; i<argument0; i+=1)
		{
			if !place_meeting(x-1,y,block) && x>kouchou.room_left_border_x+20 && place_meeting(x-1,y+1,block)
				x-=1
			else
				break;
		};
	}
}
else
{
	if right==true   /// move left
	{
	for (i=0; i<-argument0; i+=1)
		{
			if !place_meeting(x-1,y,block) && x>kouchou.room_left_border_x+20 && place_meeting(x-1,y+1,block)
				x-=1        
			else
				break;
		};
	}
	else        //// move right
	{
		for (i=0; i<-argument0; i+=1)
		{
			if !place_meeting(x+1,y,block) && x<kouchou.room_right_border_x-20 && place_meeting(x+1,y+1,block)
				x+=1
			else
				break;
		};
	}
}
