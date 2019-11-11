var bar_obj,x_amount;
bar_obj=argument0
x_amount=argument1


with bar_obj
{
	sprite_index=MOVING_SPRITE
	image_index=0
	mode="moving"
	to_move+=x_amount
}