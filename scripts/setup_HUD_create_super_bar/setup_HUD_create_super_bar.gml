/*
  create_super_bar(x,y,ID,width,number of segments)
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
	
	create_super_bar_markers(NUMBER_OF_SEGMENTS,SEGMENT_WIDTH,spr_super_bar_marker)
	
	myline=instance_create_depth(x+1,y+1,-10,hud_bar_line)
	myline.creator=self.id
	myline.SEGMENT_WIDTH=SEGMENT_WIDTH
	
	myline.NORMAL_SPRITE=super_bar_line_normal
	myline.MOVING_SPRITE=super_bar_line_moving
	myline.STOPPING_SPRITE=super_bar_line_stopping
	
	myline.sprite_index=myline.NORMAL_SPRITE
}

return new_super_bar