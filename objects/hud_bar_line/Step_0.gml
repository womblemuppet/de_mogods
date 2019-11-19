if mode=="moving"
{
	repeat(SPEED)
	{
		if to_move>0
		{
			x+=1
			to_move-=1
		}
		else
		{
			sprite_index=STOPPING_SPRITE
			image_index=0
			mode="stopping"
			break;
		}
	}

}