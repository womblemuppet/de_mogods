/***************************************************
  screenflash(colour,alpha,fade,time)
  fade 0   = will fade out
  fade 2   = won't fade out
 ***************************************************/
 
var a;
a=instance_create_depth(0,0,-100,ef_screenflash)
a.colour=argument0
a.alpha=argument1
a.fade=argument2
a.alarm[0]=argument3
