/// @description screenshake horizontal
//////

if screenshake_ammo>0
{
    if screenshake_D==0 || screenshake_D==-1
    {
        __view_set( e__VW.XView, 0, kouchou.room_left_border_x+screenshake_amount )
        screenshake_D=1
    }
    else if screenshake_D==1
    {
        __view_set( e__VW.XView, 0, kouchou.room_left_border_x-screenshake_amount )    
        screenshake_D=-1
    }
    alarm[3]=screenshake_speed
    screenshake_ammo-=1
}
else
{
    __view_set( e__VW.XView, 0, kouchou.room_left_border_x )
    screenshake_D=0
    redraw_fossil_surface()
}

