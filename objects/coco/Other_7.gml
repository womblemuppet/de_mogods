if ani==1
{   ///explode
    if instance_exists(owner)
    {
        with owner
        {
            losehp(true,"acid")
            if !place_meeting(x,y-1,block)
                y-=1
            vspd=-4   
        }
    }
    
    create_terrain_cutter(loco,"hit",90,7)


    var a;
    a=effect(nuggo,0.04,-5)
    a.y+=15
    instance_destroy()
}

