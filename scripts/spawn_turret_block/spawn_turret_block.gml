/***************************************************
  spawn_ice_block(x,y)
****************************************************/

 
var a;
a=instance_create(argument0,argument1,turret_block)   //if change this change room spawn blocks
a.sprite_index=block_turret
a.variant=choose(5,17)
a.divisible=false

with a
{
    blockchunktype=aizen.chunk_type
}
return a
