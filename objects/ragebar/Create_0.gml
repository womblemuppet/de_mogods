value=0
FILL_TEXTURE_WIDTH=40

WIDTH=600
NUMBER_OF_SEGMENTS=20
SEGMENT_WIDTH=WIDTH/NUMBER_OF_SEGMENTS
	
myline=instance_create_depth(x+1,y+1,-10,superbar_line)
myline.creator=self.id
myline.SEGMENT_WIDTH=SEGMENT_WIDTH	
