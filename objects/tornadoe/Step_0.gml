if spawn_windup_effects
{
    var d;
    d=1
    doubleat100+=1
    if doubleat100>100
    d=2     ////[code sucks]
    
    var a;
    repeat(d)   ///[finaledit] spammmm
    {
        a=effect_aniend(spiralpower_base,0.05,-1)
        a.vspeed=-0.5
        a.gravity_direction=90
        if choose(0,1)==1
        {
            a.x+=WIDTH/2-random(WIDTH)
            a.y-=random(HEIGHT-400)
            a.gravity=0.08
        }
        else
        {
            a.x+=2*(WIDTH/3)-(random(WIDTH/3)*4)
            a.y-=random(HEIGHT)  
            a.gravity=0.1
        }


    }
}

