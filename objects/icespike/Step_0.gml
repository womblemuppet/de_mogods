//trail, attached check


if (!ready && image_alpha<0.6) || (ready && image_alpha<1)  ///fade in to be deleted.
    image_alpha+=0.1
   
if shake>0
{   
    var ceb;
    ceb=3
    shake-=1
    if shake<1
    {
        speed=FALLSPEED
        if direction!=270
            speed=SHOTSPEED
    }
}
else
{
    trailcounter+=1
    if trailcounter mod 3 ==0
    {
        var a;
        a=effect(sprite_index,0.1,-2)
        a.image_angle=image_angle
    }
}


