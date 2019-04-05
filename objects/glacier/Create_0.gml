hit=false
xmin=0
xmax=room_width
ymin=0
ymax=room_height
var SLOWNESS;
SLOWNESS=1000 ///w and h divided by this amount to get speed
xspd=room_width/SLOWNESS
yspd=room_height/SLOWNESS 
FINALXSIZE=100 //x2 for final rectangle width
dying=false
life=100
STARTTIME=300
alarm[0]=STARTTIME  ///STARTTIME
mode=0
blockstokill=50
/***************************************************
  mode
  0=warning
  1=moving
  2=stops
****************************************************/

/* */
/*  */
