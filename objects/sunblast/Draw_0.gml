if right
{
	for (i=0; i<length; i+=1)
	{
		draw_sprite(sprite_index,image_index,x+i*40,y)
	};
}
else
{
	for (i=0; i<length; i+=1)
	{
		draw_sprite(sprite_index,image_index,x-i*40,y)
	};
}

