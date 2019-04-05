sprite_index=block_turret_active
image_speed=0.2
var a;
a=instance_create(x+240,y,sentinel)
a.image_blend=image_blend
a.owner=owner
with a
{
    STEPTIME=40
    alarm[0]=STEPTIME/2
    image_speed=0.2
    direction=90
    speed=4
}

