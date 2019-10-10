

if rain_on   ///[finaledit] could be optimised
{
	rain_make_block_effect_counter++
	if rain_make_block_effect_counter>RAIN_MAKE_BLOCK_EFFECT_COUNTER_MAX
	{
		rain_make_block_effect_counter=0
		with block
			effect_aniend(tornado_rain_on_block_effect,0.2,2)
	}
	rain_offset+=10
	if rain_offset>RAIN_OFFSET_MAX
		rain_offset=0
}

if snow_on
{

	snow_x_offset+=10
	snow_y_offset+=10
	
	if snow_x_offset>SNOW_TILE_SIZE
		snow_x_offset=0
	if snow_y_offset>SNOW_TILE_SIZE
		snow_y_offset=0
}


if hue==huewant
	exit

if hue_goup==true
    hue+=1
else
    hue-=1
if hue>254
    hue=0

