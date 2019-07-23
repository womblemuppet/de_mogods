if phase==3    ///starts at phase 3 btw...
{
    roundnumber+=1
    phase=0
    for (var i=1; i<7; i+=1)
    {
        instance_create((room_width/7)*i,0,lightning_totem)
    };    
    alarm[0]=100 ///phase 0 time
}
else if phase==0
{
    phase=1
    ammo=3
    ammoofammo=2
    alarm[1]=TIMEBETWEENTHREES
    alarm[2]=LIGHTNING_TIME
}
else if phase==1
{
    phase=2  //heil hydra
    var a;
    if roundnumber mod 2 ==1
    {
        repeat(40)
        {
        a=instance_create(room_width/2,5,lightningbomb)
        a.number=3
        }
    }
    else
    {
        a=instance_create(room_width/3,5,lightningbomb)
        a.number=2
        a=instance_create(2*room_width/3,5,lightningbomb)
        a.number=2
    }
    alarm[0]=600
}
else if phase==2
{
    phase=3
    alarm[0]=1
}

