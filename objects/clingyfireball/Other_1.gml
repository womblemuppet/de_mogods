if x<sprite_width || x>room_width-sprite_width
{
    if speed>0 && mode==1
    {
            speed=0
            if x<room_width/2
                direction=0
            else
                direction=180
        
            alarm[0]=125 //charge up time
            mode=0
            ammo-=1
            if ammo==1
                image_blend=c_silver
            if ammo==0  ///make melter
            {
                var a;
                a=instance_create(x,y,melter)
                if x>room_width/2
                {
                    a.direction=0
                    a.startright=true
                }
                else
                {
                    a.direction=180
                    a.startright=false
                }
                
                instance_destroy()            
            }
    }
}

