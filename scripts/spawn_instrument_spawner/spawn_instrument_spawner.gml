target_x=-1
if argument0!=noone
{
	target_x=argument0.x
}

var diggable_block;
diggable_block=find_lowest_diggable_block(target_x)

var new_spawner
new_spawner=noone

if diggable_block!=noone
{
	new_spawner=instance_create(diggable_block.x,diggable_block.y,instrument_spawner)
	new_spawner.targ=diggable_block
}
else
{
	show_debug_message("failed to find a diggable block. return = "+string(diggable_block))
}

return new_spawner


