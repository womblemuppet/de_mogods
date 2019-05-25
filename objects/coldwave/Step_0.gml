var vspd;
vspd=16
y+=vspd
travelled+=vspd

if travelled>20
{
    travelled-=20
    var yy;
    yy=y-20
    with block
    {
        if divisible==true
        {
            if y>yy && y<yy+20
            {
                a=effect_aniend(tempsnow40,0.1,-4)
                with a
                    image_index=irandom(5)
            }
        }
    }
}


if y>room_height
    instance_destroy()

