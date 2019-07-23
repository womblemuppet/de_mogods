var numberofspikes,gap,gap2,BIGTIME,SMALLTIME;
numberofspikes=15
gap=1+irandom(numberofspikes-2)
gap2=1+irandom(numberofspikes-2)
test1=gap
test2=gap2
var fuse;
fuse=0
while (gap2==gap && fuse<10)   ///dangerous
{
    fuse+=1
    gap2=irandom(numberofspikes)
}
BIGTIME=240
SMALLTIME=140


var a;
if D==90 || D==270
{
    for (var i=0; i<numberofspikes; i+=1)
    {
        if i!=gap
        {
            a=instance_create((room_width/numberofspikes)*i,-80,icetrial_falling_spikes)
            a.direction=270
            if D==90
                a.alarm[0]=SMALLTIME
            else
                a.alarm[0]=BIGTIME
            a.alarm[1]=a.alarm[0]/2.25
        }
    };
    
    for (var i=0; i<numberofspikes; i+=1)
    {
        if i!=gap2
        {
            a=instance_create((room_width/numberofspikes)*i,room_height+100,icetrial_falling_spikes)
            a.direction=90
            a.image_angle=180
            if D==90
                a.alarm[0]=BIGTIME
            else
                a.alarm[0]=SMALLTIME
            a.alarm[1]=a.alarm[0]/2.25
        }
    };
}
else
{
    for (var i=0; i<numberofspikes; i+=1)
    {
        if i!=gap
        {
            a=instance_create(0,(room_height/numberofspikes)*i,icetrial_falling_spikes)
            a.direction=0
            if D==0
                a.alarm[0]=SMALLTIME
            else
                a.alarm[0]=BIGTIME
            a.alarm[1]=a.alarm[0]/2.25
        }
    };
    
    for (var i=0; i<numberofspikes; i+=1)
    {
        if i!=gap2
        {
            a=instance_create(room_width,(room_height/numberofspikes)*i,icetrial_falling_spikes)
            a.direction=180
            a.image_angle=180
            if D==0
                a.alarm[0]=BIGTIME
            else
                a.alarm[0]=SMALLTIME
            a.alarm[1]=a.alarm[0]/2.25
        }
    };
}
alarm[6]=600
alarm[2]=1000

