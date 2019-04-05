if makeitrain==true
{

    var a;
    a=effect(memesmoke,0.01,0)
    a.x=kouchou.room_left_border_x+random(kouchou.rw)
    a.y=kouchou.room_top_border_y+random(kouchou.rh)
    a.direction=random(180)+180
    a.speed=choose(4,5)
    a.friction=0.4
    a.gravity=0.3
    a.gravity_direction=270
    a.image_angle=a.direction
}

