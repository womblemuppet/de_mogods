if instance_exists(targ1) && instance_exists(targ2)
{
	image_angle=point_direction(targ1.x,targ1.y,targ2.x,targ2.y)
	image_xscale=point_distance(targ1.x,targ1.y,targ2.x,targ2.y)/sprite_width
}