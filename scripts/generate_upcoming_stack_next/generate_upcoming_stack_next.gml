//////////////////////GENERATE NEXT ORB FOR UPCOMING STACK
var next_orb;
next_orb=choose(0,2,4,5)

with aizen
	ds_list_add(upcoming_stack,next_orb)
