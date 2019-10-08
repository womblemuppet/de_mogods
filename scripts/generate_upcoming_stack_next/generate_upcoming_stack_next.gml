//////////////////////GENERATE NEXT ORB FOR UPCOMING STACK
var next_orb;
next_orb=choose("meteors","snowball","lightning","lava","tornado")

with aizen   ///at game start there are two aizens for one step, this will apply to both of them
	ds_list_add(upcoming_stack,next_orb)
