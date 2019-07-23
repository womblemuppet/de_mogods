/// @description individual meteor timer
ammo-=1

if ammo>0
{
    if meteor_wave!=2
        alarm[0]=90
    else
    {
        alarm[0]=30
        if meteorlevel==1
            alarm[0]=20
        if meteorlevel==2
            alarm[0]=12   
    }
    
    var a,meteorsperwave;
    a=0
    meteorsperwave=5   ///per starting wave (the first wave only)
    if meteorlevel==2
        meteorsperwave=16
    
    if meteor_wave==0 
    {
        for (var i=0; i<meteorsperwave; i+=1)
        {
            a=instance_create(50+i*(room_width/meteorsperwave),-i*50,meteor)
            a.hspeed=0.75
            
            
            if meteorlevel==1
                a.image_blend=c_green
            if meteorlevel==2
                a.image_blend=c_black            
            
            
            
            
        };
    }
    else if meteor_wave==1  ///lazy
    {
        for (var i=0; i<meteorsperwave; i+=1)
        {
            a=instance_create(room_width-(50+i*(room_width/meteorsperwave)),-i*50,meteor)
            a.hspeed=-0.75
            
            if meteorlevel==1
                a.image_blend=c_green
            if meteorlevel==2
                a.image_blend=c_black            
                
            
            
            
            
        };
    }
    else if meteor_wave==2
    {
        a=instance_create((random(room_width)/40)*40,0,meteor)
        a.hspeed=-0.5+random(1)
        
        
        if meteorlevel==1
            a.image_blend=c_green
        if meteorlevel==2
            a.image_blend=c_black
    }
    meteor_wave=2
}
else
{
    meteor_wave=choose(0,1)
}

