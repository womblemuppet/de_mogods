if cd>0
    cd-=1
    
if instance_exists(owner)
{
    x=owner.x+14*owner.image_xscale
    y=owner.y+4
}
else
{
    gravity=0.2
    speed=3
    image_angle+=30
}

