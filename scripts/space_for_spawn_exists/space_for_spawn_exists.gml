var block_number;
block_number=argument0

var block_newest=terrain_buffer_layer_newest[block_number]
var block_layer2=terrain_buffer_layer2[block_number]
			
if block_newest>0 && block_layer2==-1
	return true
	
return false