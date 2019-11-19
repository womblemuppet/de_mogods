value=0
FILL_TEXTURE_WIDTH=40

WIDTH=600
NUMBER_OF_SEGMENTS=aizen.RAGE_TRIGGER_AMOUNT
SEGMENT_WIDTH=WIDTH/NUMBER_OF_SEGMENTS

create_hud_bar_markers(NUMBER_OF_SEGMENTS,SEGMENT_WIDTH,spr_rage_bar_marker)
	
myline=instance_create_depth(x+1,y+1,-10,hud_bar_line)
myline.creator=self.id
myline.SEGMENT_WIDTH=SEGMENT_WIDTH	

myline.NORMAL_SPRITE=rage_bar_line_normal
myline.MOVING_SPRITE=rage_bar_line_moving
myline.STOPPING_SPRITE=rage_bar_line_stopping

myline.sprite_index=myline.NORMAL_SPRITE