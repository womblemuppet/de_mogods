if tousen.MODE==0
{
    if ismoving
    exit
    
    var xx,yy;
    
    if aimD==0
    {
        xx=40
        yy=0
    }
    else if aimD==90
    {
        xx=0
        yy=-40
    }
    else if aimD==180
    {
        xx=-40
        yy=0
    }
    else if aimD==270
    {
        xx=0
        yy=40
    }
    
    instance_create(x+xx,y+yy,conversation_starter)
}
if tousen.MODE==1
{
    tousen.MODE=0
    tousen.dialogue_to_draw=""
}

