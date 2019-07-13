if debug==true
{
	draw_set_font(font_debug)

	draw_text(600,40,"last hit timer[0] " + string(last_hit_timer[0]))
	draw_text(600,70,"clean hit count[0] " + string(clean_hit_count[0]))

	draw_text(790,40,"last hit timer[1] " + string(last_hit_timer[1]))
	draw_text(790,70,"clean hit count[1] " + string(clean_hit_count[1]))

}