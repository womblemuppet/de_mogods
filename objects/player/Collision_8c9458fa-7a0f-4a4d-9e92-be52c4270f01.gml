losehp(false,"fire")
effect_create_above(ef_firework,x,y,2,c_red)
with firetrial_control
{
    lavaUP=false
    if alarm[1]<100
        alarm[1]=100
}

