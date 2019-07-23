var a,spr;
    spr=deathdoomcomingeffect


    
if mode==1
{
    spr=deathdoomeffect


    var xr;
    for (var i=0; i<instance_number(player); i+=1)
    {
        a=instance_find(player,i)
        if a.cursed==true
            continue;  //skips to next player (optimisation)
        xr=round(a.x/40)
        if a.y<fallamount[xr]*40
        {
            effect_create_above(ef_firework,a.x,a.y,2,c_fuchsia)
            a.cursed=true
        }
    };
}



if mode!=2
{
    for (var i=0; i<30; i+=1)
    {
        if fallamount[i]==0
            continue;     //skips to next column
        a=effect_aniend(spr,0.1,-1)
        a.x=i*40+6-random(12)
        a.y=random(fallamount[i]*40)
        a.vspeed=2+mode*1.25
    }
}


