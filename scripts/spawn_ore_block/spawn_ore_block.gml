/***************************************************
  spawn_ore_block(x,y)
****************************************************/

 
var a;
a=instance_create(argument0,argument1,ore_block)   //if change this change room spawn blocks
a.protection=0
a.sprite_index=block_ore
a.variant=choose(5,17)
a.divisible=false

with a
{
    blockchunktype=aizen.chunk_type
}
return a
