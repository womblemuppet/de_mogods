alarm[0]=300   ///die


var ceb;
ceb=300
repeat(50) /// [finaledit] wtf
{
    var a;
    a=effect(choose(snowflake1,snowflake2,snowflake3),0.0025,-4)
    a.hspeed=choose(0.6,0.9)
    a.vspeed=3
    a.gravity=0.01
    a.image_xscale=1+random(1)
    a.image_yscale=image_xscale
    a.gravity_direction=random(360)
    a.x=kouchou.room_left_border_x-ceb+random(kouchou.rw+ceb)
    a.y=kouchou.room_top_border_y-ceb+random(kouchou.rh+ceb)
}

