terrain_cutter_counter-=1
if terrain_cutter_counter==0
{
	terrain_cutter_counter=5
	var a;
	a=create_terrain_cutter(snowball_terrain_cutter_mask,"pushed",0,7)
	if hspd<0
		a.image_xscale=-1
}

x+=hspd

if x>kouchou.room_right_border_x+750 || x<kouchou.room_left_border_x-750
{
	instance_destroy()	
}