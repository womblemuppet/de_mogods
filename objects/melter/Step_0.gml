var xx,yy1,yy2;
xx=x
yy1=y-70
yy2=y+30
with block
{
    if y>yy1 && y<yy2
    {
        if distance_to_point(xx,y)<300
        {
            var a;
            a=effect_aniend(meltingblockbubbles,0.05,-2)
            a.y+=random(30)
            a.x+=5-random(10)
        }
    }
}

