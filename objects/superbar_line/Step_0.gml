if to_move>0
{
	x+=SPEED
	
	to_move-=SPEED
	
	if to_move<1
	{
		sprite_index=STOPPING_SPRITE
		image_index=0
		mode="stopping"	
	}
}