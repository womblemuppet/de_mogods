draw_self()

var xx,yy,y_offset;
xx=x+90
yy=y+30
y_offset=100


draw_set_colour(c_gray)
if select==0
	draw_set_color(c_white)

draw_text(xx+45,yy,"Control scheme: ")
draw_text(xx+45,yy+20,"    "+control_setup_text)



draw_set_colour(c_gray)
if select==1
	draw_set_color(c_white)

draw_text(xx,yy+y_offset,"Extra HP: ")
if handicap_icon!=undefined
	draw_sprite(handicap_icon,0,xx+60,yy+y_offset-20)
	
	
draw_set_colour(c_gray)
if select==2
	draw_set_color(c_white)
	
draw_text(xx,yy+y_offset*2,"Palette: "+string(palette_number))
