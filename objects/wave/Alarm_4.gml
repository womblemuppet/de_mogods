for (i=0; i<room_width/sprite_width; i+=1)
{
    for (ii=y/sprite_height; ii<room_height/sprite_height; ii+=1)
    {                               
        var a;
        a=effect(ice_shatter,0.015,-3)
        a.x=i*sprite_width+sprite_width/2
        a.y=ii*sprite_height+sprite_height/2
        a.image_speed=0
        a.image_index=random(a.image_number)
        a.direction=random(360)
        a.speed=1
        a.gravity=0.2
    };
    
};

instance_destroy()

