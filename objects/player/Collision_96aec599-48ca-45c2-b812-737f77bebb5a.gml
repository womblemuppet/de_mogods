losehp(false,"icespike")
effect_create_above(ef_firework,x,y,2,c_aqua)

with icetrial_falling_spikes
{
    effect_create_above(ef_firework,x,y,0,c_aqua)
    instance_destroy()
}


