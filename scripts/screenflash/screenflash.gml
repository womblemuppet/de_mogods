/***************************************************
  screenflash(colour,alpha,fade,time)
  fade 
  "never"
  "fade after timer"
  "fade"
 ***************************************************/

if argument2!="never" && argument2!="fade after timer" && argument2!="fade"
	show_error("screenflash unknown fade argument",true)

var a;
a=instance_create_depth(0,0,-100,ef_screenflash)
a.colour=argument0
a.alpha=argument1
a.fade=argument2
a.alarm[0]=argument3
