alarm[0]=250    ///stack call

if ds_list_empty(aizen.STACK)
{
	if ds_list_find_value(aizen.STACK,0)==2   ///if stacking meteors, stop stacking
		alarm[0]=700
}

alarm[1]=180     ///stack calling meteors
ammo=10

var numberofmeteors,gap_width,gap_height;
numberofmeteors=8
gap_width=160
gap_height=100

for (var i = 0; i < numberofmeteors/2;i++)
{
    instance_create_depth(kouchou.room_left_border_x+gap_width*i,-20-i*gap_height,0,meteor)
    instance_create_depth(kouchou.room_right_border_x-gap_width*i,-20-i*gap_height,0,meteor)
}



meteor_wave="start"   ///0=wave to right 1=wave to left 2=freethrow



