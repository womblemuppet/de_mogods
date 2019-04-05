if mode==1
{
    xmin+=xspd
    xmax-=xspd
    ymin+=yspd
    ymax-=yspd
    if xmin>(room_width/2)-FINALXSIZE
    {
        mode=2
        dying=true
    }
    
    if blockstokill>0
    {
        with block
        {
            if object_index!=ice_block && y<room_height+81
            {
                if x<glacier.xmin || x>glacier.xmax || y<glacier.ymin || y>glacier.ymax     
                {
                    glacier.blockstokill-=1
                    effect_create_above(ef_firework,x,y,0,c_aqua)
                    instance_destroy()
                }
            }
        }
    }
    
    var a;

    if instance_exists(player)
    {  
        if hit==false
        {
            a=player.id ///so I don't have to rewrite lol
            if a.x<xmin || a.x>xmax || a.y<ymin || a.y>ymax 
            {
                with player
                    losehp(true,"icecube")
                hit=true
                dying=true
            }
        }
    }
}



if dying
    life-=1
    
if life<1
{
    icetrial_control.alarm[0]=150
    icetrial_control.phase=0
    instance_destroy()
}

