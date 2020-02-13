var xx,yy,colour;
xx=argument0
yy=argument1
colour=argument6


var newProp = prop_create(xx,yy,pflag_red,pflag_red,"flag_piece",false,0)
with newProp 
{
	tx=argument2
	ty=argument3
	image_angle=point_direction(x,y,tx,ty)
	image_xscale=(tx-xx)/sprite_width
	left_flag=argument4
	right_flag=argument5
	
	//choose colour
	if colour=="red"
		sprite_index=pflag_red
	else if colour=="blue"
		sprite_index=pflag_blue


	instance_change(prop_flag_piece,false)
}
