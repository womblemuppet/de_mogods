if instance_number(player)==2
{
    var a,b,c;
    a=instance_find(player,0)
    b=instance_find(player,1)
    c=instance_find(player,2)
    effect_create_above(ef_firework,a.x,a.y,2,c_fuchsia)
    effect_create_above(ef_firework,b.x,b.y,2,c_fuchsia)
    
    var xx,yy;
    xx=a.x
    yy=a.y
    a.x=b.x
    a.y=b.y
    b.x=xx
    b.y=yy
}



if instance_number(player)==3
{
    var a,b,c;
    a=instance_find(player,0)
    b=instance_find(player,1)
    c=instance_find(player,2)
    effect_create_above(ef_firework,a.x,a.y,2,c_fuchsia)
    effect_create_above(ef_firework,b.x,b.y,2,c_fuchsia)
    effect_create_above(ef_firework,c.x,c.y,2,c_fuchsia)
    
    
    
    var xx,yy,xx2,yy2,xx3,yy3;
    xx=a.x
    yy=a.y
    xx2=b.x
    yy2=b.y    
    xx3=c.x
    yy3=c.y
    
    
    a.x=xx2
    a.y=yy2
    b.x=xx3
    b.y=yy3
    c.x=xx
    c.y=yy
}


