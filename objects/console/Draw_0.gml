draw_set_alpha(0.6)
draw_set_color(BACK_COLOUR)
draw_set_halign(fa_left)
draw_set_font(font_debug)
draw_rectangle(x-10,y,x+WIDTH-10,y+MAXY,false)
draw_set_color(c_silver)


////draw log
for (var i=log_pos;i<log_pos_last;i++)
{
	draw_text(x+HISTORY_X_OFFSET,y+yoffset+(i-log_pos)*vgap,log[| i])
}

////draw current input
draw_set_color(c_white)
draw_line(x,y+input_pos_y_offset-12,x+WIDTH-10,y+input_pos_y_offset-12)
draw_text(x,y+input_pos_y_offset,keyboard_string)
draw_set_color(c_lime)
draw_text(x+string_width(keyboard_string),y+input_pos_y_offset,"|")
draw_set_alpha(1)