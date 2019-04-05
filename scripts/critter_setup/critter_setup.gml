/***************************************************
    critter_setup(type)      
    called by critter when first being made
****************************************************/

switch argument0
{
    case "worm":
    moving_sprite=worm_test
    stationary_sprite=worm_test
    moving_image_speed=0.1
    D=choose(0,180)
    movement="walk"
    spd=1
    move_time=50
    wait_time=200 break;
    default:
    show_error("unidentified critter variant",true) break;
}

hspd=0
vspd=0
ismoving=false
alarm[0]=wait_time
sprite_index=moving_sprite
hspd=0

