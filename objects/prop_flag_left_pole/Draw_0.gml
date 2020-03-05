draw_self()
//draw_sprite_ext(sprite_index,image_index,x,y,image_xscale,image_yscale,image_angle,image_blend,image_alpha)
draw_set_colour(c_purple)

if !instance_exists(flag_end_point)
{
	instance_destroy()
	exit
}

draw_line(x,y,flag_end_point.x,flag_end_point.y)