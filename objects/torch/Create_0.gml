//show_message("torcharoo! my y is "+string(y))
hit=false
vspd=0
image_speed=0.1
alarm[1]=1

var xx,yy;
xx=x
yy=y
with block
{
    if distance_to_point(xx,yy)<80
    {
        x=-700
        instance_destroy()
    }
}

active=true

