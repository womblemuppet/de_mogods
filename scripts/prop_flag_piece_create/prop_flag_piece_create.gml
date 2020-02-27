/**********************************************
//prop_flag_piece_create(xx,yy,xx+PIECE_LENGTH,yy+PIECE_HEIGHT,left_flag,right_flag,lastColour)
**********************************************/
var xx,yy,colour,endx,endy,left_flag_id,right_flag_id;
xx=argument0
yy=argument1
endx=argument2
endy=argument3
left_flag_id = argument4
right_flag_id = argument5
colour=argument6

var a;
a=prop_create(xx,yy,pflag_red,pflag_red,"flag_piece",false,0) 

with a
{	
	//reset the position of the flag piece without random variation from prop_create
	x=xx
	y=yy
	
	//set direction, scale, and prop_flag_piece specific variables
	image_angle=point_direction(xx,yy,endx,endy)
	image_xscale=(endx-xx)/sprite_width
	left_flag=left_flag_id
	right_flag=right_flag_id
	hover_dir="up"
	HOVER_SPEED=0.01
	HOVER_MAX_DIST=1
	y-=HOVER_MAX_DIST+random(HOVER_MAX_DIST)
	
	//choose colour
	if colour=="red"
	{
		sprite_index=pflag_red
		death_sprite=pflag_red
	}
	else if colour=="blue"
	{
		sprite_index=pflag_blue
		death_sprite=pflag_blue
	}
	else
		show_error("pflag_piece undefined sprite",true)
}

return a