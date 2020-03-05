var xs,ys,xe,ye;
xs=argument0
ys=argument1
xe=argument2
ye=argument3

STRAIGHT_PIECE_LENGTH=28
STRAIGHT_PIECE_HEIGHT=28

//create flagpoles (resetting x after the random variation is added in prop_create)
var left_flag;
left_flag=prop_create(xs,ys,pflag_red_start,pflag_red_start,"flag_start",false,1)
	left_flag.x=xs

var right_flag;
right_flag=prop_create(xe,ye,pflag_red_start,pflag_red_start,"flag_start",false,1)
	right_flag.x=xe

left_flag.flag_end_point=right_flag
with left_flag
	instance_change(prop_flag_left_pole,true)

var offsetX,raiseY;
offsetX=20
raiseY=30

left_flag.x+=offsetX
right_flag.x+=offsetX
left_flag.y-=30
right_flag.y-=30

var angle=point_direction(xs,ys,xe,ye)
var PIECE_LENGTH=lengthdir_x(STRAIGHT_PIECE_LENGTH,angle)
var PIECE_HEIGHT=lengthdir_y(STRAIGHT_PIECE_HEIGHT,angle)
var NO_pieces=(point_distance(xs,ys,xe,ye)/STRAIGHT_PIECE_LENGTH)-1
if frac(NO_pieces)>0.2
	NO_pieces++



//spawn pieces from pole to pole
var xx,yy,lastColour;
xx=xs
yy=ys
lastColour="red"

for (var i = 0; i < NO_pieces; i++) 
{
	//switch to next colour
	if lastColour=="red"
		lastColour="blue"
	else
		lastColour="red"
	
	//create flag and increment position
	with prop_flag_piece_create(xx+offsetX,yy-raiseY,xx+PIECE_LENGTH+offsetX,yy+PIECE_HEIGHT-raiseY,left_flag,right_flag,lastColour)
	{
		instance_change(prop_flag_piece,false)  ///convert prop instance into more specific prop_flag_piece
		alarm[0]=1  //set sprite to correct sprite (must be done to get around instance change)
	}

	xx+=PIECE_LENGTH
	yy+=PIECE_HEIGHT
}