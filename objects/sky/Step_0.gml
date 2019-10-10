

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
	if snow_effect_disable_side_change_counter>0
		snow_effect_disable_side_change_counter-=1

	snow_x_offset+=snow_hspd
	snow_y_offset+=snow_vspd
	
	if snow_x_offset>SNOW_TILE_SIZE
		snow_x_offset-=SNOW_TILE_SIZE
	if snow_x_offset<1
		snow_x_offset+=SNOW_TILE_SIZE
	if snow_y_offset>SNOW_TILE_SIZE
		snow_y_offset-=SNOW_TILE_SIZE

}


if hue==huewant
	exit

if hue_goup==true
    hue+=1
else
    hue-=1
if hue>254
    hue=0

