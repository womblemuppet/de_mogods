if hitgroundaction=="disappear"
    instance_destroy()
else
{
    if speed>0
        alarm[1]=choose(5,15)
    speed=0
    gravity=0   
}

