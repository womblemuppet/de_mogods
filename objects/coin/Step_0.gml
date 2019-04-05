image_blend=c_white   //[finaledit] disgusting

if !place_meeting(x,y+1,block)
{
    vspd+=1   ///gravity
}
else //if place_meeting(x,y+1,block)
{
    if y<200                 ///////////cuttercoins
    {
        image_blend=c_red
        if instance_place(x,y+1,block)!=-1 && instance_place(x,y+1,block)!=noone
        {
            effect_create_above(ef_firework,x,y,1,c_yellow)
            with instance_place(x,y+1,block)
                instance_destroy()
        }
    }
    if vspd<5                   /////bounce
        vspd=0
    else 
    {
        vspd=-vspd/2
        y-=1
    }
   
}
if place_meeting(x,y-1,block)
{
    vspd=1
}


if vspd>12
    vspd=12
if vspd<-18
    vspd=-18
    
if vspd>0
{
    repeat(vspd)
    {
        if !place_meeting(x,y+1,block)
        {
            y+=1
        }
    }
}

    
if vspd<0
{
    repeat(-vspd)
    {
        if !place_meeting(x,y-1,block)
        {
            y-=1
        }
    }
}
if fade
{
    image_alpha-=0.05
    if image_alpha<0.05
        instance_destroy()
}


