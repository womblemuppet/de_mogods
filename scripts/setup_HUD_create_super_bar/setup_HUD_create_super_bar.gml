/*
  create_super_bar(x,y,ID,width)
*/

var startx,starty,ID,width,number_of_segments;
startx=argument0
starty=argument1
ID=argument2
width=argument3
number_of_segments=argument4

var new_super_bar;
new_super_bar=instance_create_depth(startx,starty,-9,superbar)

new_super_bar.WIDTH=width

with new_super_bar
{
	NUMBER_OF_SEGMENTS=number_of_segments
	SEGMENT_WIDTH=WIDTH/NUMBER_OF_SEGMENTS
	
	myline=instance_create_depth(x+1,y+1,-10,superbar_line)
	myline.creator=self.id
	myline.SEGMENT_WIDTH=SEGMENT_WIDTH
	
}

return new_super_bar