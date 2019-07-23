//overall timer
if !instance_exists(player)
    exit


wavecounter+=1
if wavecounter==10 || wavecounter==16
{
    numberofclingys+=1
}

ammo=10
if wavecounter>8
{
    meteorlevel=1
    ammo=25
}
if wavecounter>18
{
    meteorlevel=2
    ammo=35
}

alarm[0]=1
alarm[1]=WAVETIMER  //[finaledit] variable depeding on if taken damage
if wavecounter>8
alarm[1]=WAVETIMER+300 //[finaledit] ^


lavaUP=true
if wavecounter mod 3 ==0
{   ///create clingy
    for (var i=1; i<numberofclingys+1; i+=1)
    {        
        var a,b,c;
        b=1
        if i mod 2 == 1
        b=room_width-1
        c=room_height-120*i
        a=instance_create(b,c,clingyfireball)  ///[finaledit] dont make these dmg you on spawn, unfair for people on edge
        if b>room_width/2
            a.direction=180
        a.alarm[0]=120+i*110
    }
     
    //if numberofclingys<4
    //    numberofclingys+=1
    
    lavaUP=false
};


