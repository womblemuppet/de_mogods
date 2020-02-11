var xs,ys,xe,ye;
xs=mouse_x
ys=mouse_y
xe=mouse_x+random(500)+100
ye=ys-200+random(400)

STRAIGHT_PIECE_LENGTH=28


//create flagpoles (resetting x after the random variation is added in prop_create)
var left_flag;
left_flag=prop_create(xs,ys,pflag_red_start,pflag_red_start,"flag_start",true,false,1)
	left_flag.x=xs
var right_flag;
right_flag=prop_create(xe,ye,pflag_red_start,pflag_red_start,"flag_start",true,false,1)
	right_flag.x=xe


var angle=point_direction(xs,ys,xe,ye)
var PIECE_LENGTH=lengthdir_x(STRAIGHT_PIECE_LENGTH,angle)
var NO_pieces=(xe-xs)/PIECE_LENGTH - 1
var yincrement=(ye-ys)/NO_pieces


//spawn pieces from pole to pole
var xx,yy;
xx=xs
yy=ys
for (var i = 0; i < NO_pieces; i++) 
{
	prop_flag_piece_create(xx,yy,xx+PIECE_LENGTH,yy+yincrement,left_flag,right_flag)
	xx+=PIECE_LENGTH
	yy+=yincrement
}