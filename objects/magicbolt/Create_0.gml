image_speed=0.1
hit=false

repeat(25)
{
    var a;
    a=effect(memesmoke,0.01,-1)
    a.direction=random(360)
    a.speed=choose(4,5)
    a.friction=0.1
    a.gravity=0.2
    a.gravity_direction=random(360)
    a.image_angle=a.direction
}

