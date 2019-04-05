/***************************************************
  prop_create(x,y,sprite,death sprite)
****************************************************/


var a;
a=instance_create(argument0,argument1,prop)
a.sprite_index=argument2
a.death_sprite=argument3

with a
{
    y-=sprite_height
    var fuse;
    fuse=0
    while (    fuse<500 && collision_rectangle(x,y,x+sprite_width,y+sprite_height,block,false,true)!=noone     )
    {
        fuse+=1
        with collision_rectangle(x,y,x+sprite_width,y+sprite_height,block,false,true)
            instance_destroy()
    }
}
