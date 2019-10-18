if rain_on
{
	for (var i = -1; i <1+ kouchou.room_right_border_x/TORNADO_RAIN_TILE_SIZE;i++)
	{
		for (var ii = -1; ii <1+ kouchou.room_bottom_border_y/TORNADO_RAIN_TILE_SIZE;ii++) 
		{
			draw_sprite(tornado_rain_tile,0,i*TORNADO_RAIN_TILE_SIZE+rain_offset,ii*TORNADO_RAIN_TILE_SIZE+rain_offset)
		}
	}	
}

if snow_on
{
	for (var i = -1; i <1+ kouchou.room_right_border_x/SNOW_TILE_SIZE;i++)
	{
		for (var ii = -1; ii <1+ kouchou.room_bottom_border_y/SNOW_TILE_SIZE;ii++) 
		{
			draw_sprite(snow_sprite,0,i*SNOW_TILE_SIZE+snow_x_offset,ii*SNOW_TILE_SIZE+snow_y_offset)
		}
	}	
}
