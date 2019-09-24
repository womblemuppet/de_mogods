storm_top_layer_offset_x_counter++
if storm_top_layer_offset_x_counter>3   ///move 1 px every 3 steps
{
	storm_top_layer_offset_x++
	storm_top_layer_offset_x_counter=0
}

if storm_top_layer_offset_x>STORM_TOP_LAYER_SPRITE_WIDTH    ///loop sprite
	storm_top_layer_offset_x=0

