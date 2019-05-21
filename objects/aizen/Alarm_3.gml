/// @description screenshake horizontal
//////

if screenshake_ammo>0
{
    if screenshake_D==0 || screenshake_D==-1
    {
		camera_set_view_pos(aizen.main_cam,kouchou.room_left_border_x+screenshake_amount,kouchou.room_top_border_y)
        screenshake_D=1
    }
    else if screenshake_D==1
    {
        camera_set_view_pos(aizen.main_cam,kouchou.room_left_border_x-screenshake_amount,kouchou.room_top_border_y)
        screenshake_D=-1
    }
    alarm[3]=screenshake_speed
    screenshake_ammo-=1
}
else
{
    camera_set_view_pos(aizen.main_cam,kouchou.room_left_border_x,kouchou.room_top_border_y)
    screenshake_D=0
    redraw_fossil_surface()
}

