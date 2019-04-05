if owner==-1 
{
    if y<aizen.CREATIONDELAY-1500
        grav(16)
        //[finaledit] if y>10000 instance_die
}
else
{
    if instance_exists(owner)
    {
        x=owner.x
        y=owner.y-15
    }
}

if !breaking
{
    if right
    {
        repeat(spd)
        {
            if !place_meeting(x+1,y,block) && x<kouchou.room_right_border_x+room_boundary_no_go_distance
                x+=1
            else
                break;
        }
    }
    else
    {
        repeat(spd)
        {
            if !place_meeting(x-1,y,block) && x>kouchou.room_left_border_x-room_boundary_no_go_distance
                x-=1
            else
                break;
        }
    }
}

