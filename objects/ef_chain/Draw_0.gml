if instance_exists(target)
{
	tx=target.x
	ty=target.y
}

//draw_set_colour(c_red)
image_angle=point_direction(x,y,tx,ty)
draw_sprite_ext(spr_temp_baitchain,0,x,y,distance_to_point(tx,ty)/95,1,image_angle,image_blend,image_alpha)
draw_sprite_ext(spr_baitchain_floaty,0,tx,ty,1,1,0,c_white,1)
//draw_line(xstart,ystart,tx,ty)

/* */
/*  */
