instance_create(kouchou.room_left_border_x,kouchou.room_top_border_y,coldwave)
with icespike
    icicle_fall_code(0)

screenflash(c_aqua,0.1,0,12)


alarm[0]=200   ///die
alarm[1]=120    ///icicle spawn

var ceb;
ceb=300
repeat(50) /// [finaledit] wtf
{
    var a;
    a=effect(choose(snowflake1,snowflake2,snowflake3),0.0025,-4)
    a.hspeed=choose(0.6,0.9)
    a.vspeed=3
    a.gravity=0.01
    a.image_xscale=1+random(1)
    a.image_yscale=image_xscale
    a.gravity_direction=random(360)
    a.x=kouchou.room_left_border_x-ceb+random(kouchou.rw+ceb)
    a.y=kouchou.room_top_border_y-ceb+random(kouchou.rh+ceb)
}

with wave
{
    frozen=true
    alarm[4]=40
}
if instance_exists(wave)
{
    var level;
    level=wave.y
    
    with player
    {
        if y>level
        {   //[finaledit] frozen animation on player? another effect? something?
            STUNNED2=50 ///untested
            var a;
            a=instance_create(x,y,ef_stunspiral)
            a.offsetx=0
            a.offsety=0
            a.targ=self.id
            a.depth=-2
            a.image_speed=0.15
            a.sprite_index=icecube
            vspd=0
            hspd=0
            losehp(false,"icecube")
        }
    }
}

with freakyfishtime
{
    mode=2
    frozen=true
    alarm[1]=40
}

