if ready
{
    var fuse;
    fuse=0
    while (fuse<aizen.bh && !place_meeting(x,y,block))
    {
        fuse+=1
        y-=1
    }
    instance_create(x,y-20,lightning_collectable)
    create_terrain_cutter(eightysqcircle,"hit",-1,7)
    instance_destroy()
}

