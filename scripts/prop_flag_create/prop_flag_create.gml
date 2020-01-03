var xs,ys,xe,ye;
xs=300
ys=mouse_y
xe=700
ye=mouse_y+150

PIECE_LENGTH=28


//create flagpoles
with prop_create(xs,ys,pflag_red_start,pflag_red_start,"flag_start",true,false,1)
{
	x=xs
	y=ys
}
with prop_create(xe,ye,pflag_red_start,pflag_red_start,"flag_start",true,false,1)
{
	x=xs
	y=ys
}


var NO_pieces=(xe-xs)/PIECE_LENGTH;
var yincrement=(ye-ys)/NO_pieces


//spawn pieces from pole to pole
var xx,yy,xprev,yprev;
xx=xs+PIECE_LENGTH
yy=ys
for (var i = 0; i < NO_pieces; i++) 
{
	prop_flag_piece_create(xx,yy,xx+PIECE_LENGTH,yy+yincrement)
	xprev=xx
	yprev=yy
	xx+=PIECE_LENGTH
	yy+=yincrement
}