with top_HUD.my_rage_bar
{
	value+=argument0
	
	var w;
	w=SEGMENT_WIDTH

	hud_line_bar_move(myline,w*argument0)
}
