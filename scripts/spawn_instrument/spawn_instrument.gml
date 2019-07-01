target_x=-1
if argument0!=noone
{
	target_x=argument0.x
}

var diggable_block;
diggable_block=find_lowest_diggable_middle_block(target_x)

var new_block
new_block=noone

if diggable_block!=noone
{
	new_block=spawn_instrument_block(diggable_block.x,diggable_block.y)
	with diggable_block
		instance_destroy()
}
else
{
	show_debug_message("failed to find a diggable block. return = "+string(diggable_block))
}

return new_block


//var diggable_block
//diggable_block=find_a_diggable_block()
//if diggable_block>0
//{
//	with diggable_block
//	{
//		spawn_instrument_block(x,y)
//		instance_destroy()
//	}
//}
//else
//{
//	show_debug_message("failed to find a diggable block. return = "+string(diggable_block))
//}

