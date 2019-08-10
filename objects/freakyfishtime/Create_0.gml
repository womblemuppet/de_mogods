//show_message("freakyfishtime")
image_speed=0.15
mode=0    ////0= waiting for player to trigger  1=triggered 3=irrelevant
frozen=false
image_alpha=0.5
y=room_height
SPEED=2
UP_TIME=60   ///wave moves up for this amount at start


timer[12]=-1
for (var i=0; i<12; i+=1)
{
    timer[i]=-1
};

alarmnumber=0

myfft=global.fft//[finaledit] 
//show_message("fft created. my number is "+string(myfft)
global.fft+=1

var irrelevant;
irrelevant=false
if instance_number(freakyfishtime)==1
    first=true
else
    first=false

if !first       ///////////raise water
{
    if !instance_exists(wave)
    {
        with freakyfishtime
        {
            if first==true
            {
                alarm[2]=UP_TIME
                vspeed=-SPEED
            }
        }
    }
    else     //////////////jellyfish yo
    {
        for (var i=0; i<6; i+=1)
        {
            instance_create(clamp(kouchou.room_left_border_x,aizen.bw*((i*kouchou.rw/6)/aizen.bw)+choose(-aizen.bw,0,aizen.bw),kouchou.room_right_border_x),kouchou.room_bottom_border_y+choose(0,0,80,80,240,280,440,480),jellyfish)    
        };
    }
    
    var me;
    me=self.id   
    with freakyfishtime
    {
        if self.id!=me
        {
            if ds_list_size(aizen.STACK)>1 || (ds_list_size(aizen.STACK)==1 && !instance_exists(wave))  ///if not the last on the stack   (if last on the stack, if there is a wave it will call the stack when dead.
            {
                //if ds_list_size(aizen.STACK)>1
                    //show_message(string(myfft)+" is not the last on the stack, setting alarm")
                //else if (ds_list_size(aizen.STACK)==1 && !instance_exists(wave))
                    //show_message(string(myfft)+" is the last on stack with no wave to wait for")
                timer[alarmnumber]=100
                alarmnumber+=1
            }
        }
    }
        
    //show_message("death, number="+string(myfft))
    if frozen && mode!=3
    {
        for (var i=kouchou.room_left_border_x; i<kouchou.room_right_border_y/sprite_width; i+=1)
        {
            for (ii=y/sprite_height; ii<room_height/sprite_height; ii+=1)
            {                               
                var a;
                a=effect(ice_shatter,0.015,-3)
                a.x=i*sprite_width+sprite_width/2
                a.y=ii*sprite_height+sprite_height/2
                a.image_speed=0
                a.image_index=random(a.image_number)
                a.direction=random(360)
                a.speed=1
                a.gravity=0.2
            };
            
        };
    }
    
    
    instance_destroy()    
}
else
{
    vspeed=-SPEED
    alarm[2]=UP_TIME ///time to stop moving
    //show_message("first fft, calling alarm[0]")
    alarm[0]=280 ///time to call next stack
}



