if !instance_exists(player)
{
    instance_destroy()
    exit
}  //to be safe

image_xscale=1.5
image_yscale=1.5
image_speed=0.2
SPEED=10
targ=player.id
alarm[1]=20  //fire trail
ammo=5
mode=0
/***************************************************
    mode
0=ON SIDE, homing in on player y
1=ATTACKING
2=small timer before becoming 1 (to get past intersect boundary check
**************************************************/

/* */
/*  */
