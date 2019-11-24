draw_self()
draw_text(x,y,"Control scheme: "+control_setup_text)
if handicap_icon!=undefined
	draw_sprite(handicap_icon,0,x,y+40)
draw_text(x,y,"Extra HP: "+string(palette_number))
