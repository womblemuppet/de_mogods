draw_self()

var xx,yy;
xx=x+90
yy=y+30
draw_text(xx,yy,"Control scheme: ")
draw_text(xx,yy+20,"  "+control_setup_text)

var y_offset;
y_offset=100

draw_text(xx,yy+y_offset,"Extra HP: ")
if handicap_icon!=undefined
	draw_sprite(handicap_icon,0,x,y+40)
	
draw_text(xx,yy+y_offset*2,"Palette: "+string(palette_number))
