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
                if part!=0
                {
                    a=effect_aniend(tempsnow20,0.1,-4)
                    with a
                        image_index=irandom(5)
                }
                else
                {
                    var a,b,c,d;
                    d=effect_aniend(tempsnow20,0.1,-4)
                    a=effect_aniend(tempsnow20,0.1,-4)
                    a.x+=20
                    b=effect_aniend(tempsnow20,0.1,-4)
                    b.y+=20
                    c=effect_aniend(tempsnow20,0.1,-4)
                    c.x+=20
                    c.y+=20
                    with a
                        image_index=irandom(5)
                    with b
                        image_index=irandom(5)
                    with c
                        image_index=irandom(5)
                    with d
                        image_index=irandom(5)
                }
            }
        }
    }
}


if y>room_height
    instance_destroy()

