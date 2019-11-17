var player_P,amount;
player_P=argument0
amount=argument1


with top_HUD.super_bars_array[player_P]
{
	value+=amount

	var w;
	w=SEGMENT_WIDTH

	hud_line_bar_move(myline,w*amount)


}
