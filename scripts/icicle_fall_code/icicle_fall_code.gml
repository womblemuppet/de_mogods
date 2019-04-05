/***************************************************
icicle_fall_code(0= down 1= right 2= left)

sets the shake (to tick down in step event) and the direction
when shake becomes 0, the icicle gets a speed value
falling gets set to true
****************************************************/
 

if falling==false || argument0!=0   ///untested [finaledit]
{
    var a;
    a=effect_aniend(ice_base,0.1,-2)
    a.x-=10
    a.y-=20
    sprite_index=icicles_sprite_flying
    shake=60
    if argument0==0
        direction=270
    else if argument0==1
    {
        shake=2
        direction=0
        image_angle=90
        ready=false
        alarm[0]=10
    }
    else if argument0==2
    {
        shake=2
        direction=180
        image_angle=270
        ready=false
        alarm[0]=10
    }    
    image_speed=0.3
    falling=true
}
