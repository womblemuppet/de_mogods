image_speed=0.5
var a;
a=instance_create(x+240,y,sentinel)
a.image_blend=image_blend
a.owner=owner
with a
{
    STEPTIME=50
    alarm[0]=25
    image_speed=0.2
    direction=90
    speed=5
}

