draw_set_alpha(0.6)
draw_set_color(c_black)
draw_set_halign(fa_left)
draw_set_font(font_debug)
draw_rectangle(x-10,y,x+WIDTH-10,y+MAXY,false)
draw_set_color(c_silver)

for (var i=log_pos;i<log_pos_last;i++)
{
	draw_text(x,yoffset+(i-log_pos)*vgap,log[| i])
}

draw_set_color(c_white)
draw_line(x,input_pos_y-12,x+WIDTH-10,input_pos_y-12)
draw_text(x,input_pos_y,keyboard_string)
draw_set_color(c_lime)
draw_text(x+string_width(keyboard_string),input_pos_y,"|")
draw_set_alpha(1)