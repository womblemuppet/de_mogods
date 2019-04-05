ismoving=!ismoving

if ismoving
{
    if movement=="walk"
    {
        image_speed=moving_image_speed
        sprite_index=moving_sprite
        if D==0
        {
            D=180
        }
        else
            D=0 
        if D==0     ///[finaledit] waste of check here
        {  
            hspd=spd
            image_xscale=1
        }
        else if D==180
        {
            hspd=-spd
            image_xscale=-1
        }
    }
    
    alarm[0]=move_time
}
else
{
    if movement=="walk"
    {
        sprite_index=stationary_sprite
        hspd=0
        alarm[0]=wait_time
    }
}

