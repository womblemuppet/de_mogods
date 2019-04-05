if other.ready==true
{
    losehp(false,"icespike")
    
    with other
    {
            effect_create_above(ef_firework,x,y,1,c_white)
            instance_destroy()
    }

}

