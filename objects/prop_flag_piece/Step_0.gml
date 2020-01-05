if hover_dir=="up"
{
	y-=HOVER_SPEED
	if y<ystart-HOVER_MAX_DIST
		hover_dir="down"
}
else
{
	y+=HOVER_SPEED
	if y>ystart+HOVER_MAX_DIST
		hover_dir="up"
}