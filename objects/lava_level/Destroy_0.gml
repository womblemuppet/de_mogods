/////////////////////// create dying lava effects
var a,EFFECT_WIDTH;
EFFECT_WIDTH=64
for (var i = 0; i < kouchou.rw/EFFECT_WIDTH; i++)
{
    a=effect_aniend(lava_disperse_tile_effect,0.2,-1)
    a.x=kouchou.room_left_border_x+i*EFFECT_WIDTH
}
