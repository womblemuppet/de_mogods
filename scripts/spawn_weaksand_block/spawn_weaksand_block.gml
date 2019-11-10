/***************************************************
  spawn_weaksand(x,y)
****************************************************/

 
var a;
a=instance_create(argument0,argument1,weaksand)   //if change this change room spawn blocks
a.sprite_index=weaksand_sprite
a.variant=choose(5,17)
a.divisible=false

with a
{
    blockchunktype=aizen.chunk_type
}
return a
