/// @description make snowball
var a;
if side=="right"
{
	a=instance_create_depth(kouchou.room_right_border_x+SNOWBALL_X_OFFSET,lowesty,-1,snowball)
	a.hspd=-SNOWBALL_SPEED
	a.direction=180
}
else
{
	a=instance_create_depth(-SNOWBALL_X_OFFSET,lowesty,-1,snowball)
	a.hspd=SNOWBALL_SPEED
	a.direction=0
}
	
