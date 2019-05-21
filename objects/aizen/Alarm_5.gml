/// @description vertical screenshake

if vscreenshake_ammo>0
{
    if vscreenshake_D==0 || vscreenshake_D==-1
    {
		camera_set_view_pos(aizen.main_cam,kouchou.room_left_border_x,kouchou.room_top_border_y-vscreenshake_amount)
        vscreenshake_D=1
    }
    else if vscreenshake_D==1
    {
		camera_set_view_pos(aizen.main_cam,kouchou.room_left_border_x,kouchou.room_top_border_y+vscreenshake_amount) 
        vscreenshake_D=-1
    }
    alarm[5]=vscreenshake_speed
    vscreenshake_ammo-=1
}
else
{
	camera_set_view_pos(aizen.main_cam,kouchou.room_left_border_x,kouchou.room_top_border_y)
    vscreenshake_D=0
}

