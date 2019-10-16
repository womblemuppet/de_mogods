/*
  create_super_bar(x,y,ID,width)
*/

var startx,starty,ID,width;
startx=argument0
starty=argument1
ID=argument2
width=argument3

var new_super_bar;
new_super_bar=instance_create_depth(startx,starty,-9,superbar)

new_super_bar.ID=ID
new_super_bar.WIDTH=width

with new_super_bar
{
	NUMBER_OF_SEGMENTS=12
	SEGMENT_WIDTH=WIDTH/NUMBER_OF_SEGMENTS
	
	myline=instance_create_depth(x+1,y+1,-10,superbar_line)
	myline.creator=self.id
	myline.SEGMENT_WIDTH=SEGMENT_WIDTH
	
}