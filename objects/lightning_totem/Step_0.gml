if mode==0
{
    var a;
    a=effect_aniend(sprite_index,0.1,2)
    a.direction=random(360)
    a.speed=5
    a.image_xscale=0.2
    a.image_yscale=0.2
    
    if y>room_height-100
    {
        mode=1
        speed=0
        image_speed=0
        image_index=0
    }
}
if x<5
    direction=0 
else if x>room_width-5
    direction=180

