var sgn;
sgn=1
if argument0=="left"
	sgn=-1
	
var offset_x;
offset_x=30

var block_to_check;
block_to_check=instance_place(x+offset_x*sgn,y,block)

if block_to_check==noone
	return "do_not_roll"



var block_above;
block_above=instance_position(block_to_check.x,block_to_check.y-1,block)

if block_above!=noone
	return "do_not_roll"



var px_above_block;
px_above_block=block_to_check.y-y

if px_above_block<-10 
	return "do_not_roll"

return "roll"