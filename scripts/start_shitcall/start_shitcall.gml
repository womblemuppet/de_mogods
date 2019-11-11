/***************************************************
  shitcall
****************************************************/

with current_shitcall
	instance_destroy()

current_shitcall=instance_create_depth(0,0,0,shitcall_event)
screenshake(5,12)
mode=1