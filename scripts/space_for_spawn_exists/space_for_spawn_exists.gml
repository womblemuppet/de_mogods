var block_number;
block_number=argument0

var space_at_spawn=block_history_newest[block_number]
var space_above_at_spawn=block_history_layer_2[block_number]
			
if space_at_spawn>0 && space_above_at_spawn<0
	return true
	
return false