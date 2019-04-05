/***************************************************
  spawn_ice_block(x,y)
****************************************************/

 
var a;
a=instance_create(argument0,argument1,meteor_block)   //if change this change room spawn blocks
a.protection=0
a.part=1
a.sprite_index=block_meteor
a.variant=choose(5,17)
a.divisible=false

with a
{
    blockchunktype=aizen.chunk_type
}
return a
