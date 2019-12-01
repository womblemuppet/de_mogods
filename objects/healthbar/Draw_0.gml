draw_self()

var xx,yy;
for (var segment_number = 0; segment_number < H;segment_number++)
{
	xx=x+segments_x[segment_number]
	yy=y+10
	draw_sprite(healthbar_segment_red,0,xx,yy)
}
