alarm[0]=250    ///stack call

if ds_list_empty(aizen.STACK)
{
	if ds_list_find_value(aizen.STACK,0)==2   ///if stacking meteors, stop stacking
		alarm[0]=700
}

alarm[1]=180     ///stack calling meteors
ammo=10

var numberofmeteors,gap_width,gap_height;
numberofmeteors=6
gap_width=180
gap_height=100

for (var i = 0; i < numberofmeteors/2;i++)
{
    instance_create_depth(kouchou.room_left_border_x+gap_width*i,-20-i*gap_height,-1,meteor)
    instance_create_depth(kouchou.room_right_border_x-gap_width*i,-20-i*gap_height,-1,meteor)
}

var previously_existed;
previously_existed=false

if instance_exists(red_sky_effect)
{
	with red_sky_effect
		instance_destroy()
	previously_existed=true
}

myskyeffect=instance_create_depth(0,0,0,red_sky_effect)
if previously_existed
	myskyeffect.image_index=image_number

