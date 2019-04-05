var b;

repeat(4)
{
    b=effect_aniend(sprite_index,0.2,-2)
    b.image_xscale=0.1
    b.image_yscale=0.1
    b.speed=7+random(3)
    b.direction=random(360)
    b.gravity=0.2
    b.image_blend=c_dkgray
}


