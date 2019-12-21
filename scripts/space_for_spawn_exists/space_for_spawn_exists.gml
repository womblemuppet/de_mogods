var block_number;
block_number=argument0

var space_at_spawn=terrain_buffer_layer_newest[block_number]
var space_above_at_spawn=terrain_buffer_layer2[block_number]
			
if space_at_spawn>0 && space_above_at_spawn<0
	return true
	
return false