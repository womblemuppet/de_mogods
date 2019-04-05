//if ready
    grav(8)

if hspd!=0
{
    repeat(abs(hspd))
    {
        if !place_meeting(x+sign(hspd),y,block)
            x+=1*sign(hspd)
        else
        {
            hspd=0
        }
        
       //////////////////////////////////limit to room boundary///////////////////////////////
        if x>kouchou.room_right_border_x-sprite_width
        {
            x=kouchou.room_right_border_x-sprite_width
            hspd=0
        }
        if x<kouchou.room_left_border_x+sprite_width
        {
            x=kouchou.room_left_border_x+sprite_width
            hspd=0
        }
        
    }
    ////////////////////////////////////////////// friction ///////////////////////////
    if place_meeting(x,y+1,block)
    {
        if hspd>0
            hspd-=0.5
        if hspd<0
            hspd+=0.5
    }
}
    
 
if alarm[1]<100
{
    if random(1)>0.95
        effect_create_above(ef_firework,x,y-5,0,c_white)
}


