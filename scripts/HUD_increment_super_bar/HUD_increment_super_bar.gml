


var player_P;
player_P=argument0

with top_HUD.super_bars_array[player_P]
{
	value++

	var w;
	w=SEGMENT_WIDTH

	with myline
	{
		sprite_index=MOVING_SPRITE
		image_index=0
		mode="moving"
		to_move+=w/SPEED
	}
}
