draw_set_color(c_black)
draw_set_halign(fa_left)
draw_set_font(font_debug)

for (var i=0;i<ds_list_size(log);i++)
{
	draw_text(x,yoffset+i*vgap,log[| i])
}

draw_set_color(c_white)
draw_text(x,input_pos_y,keyboard_string)