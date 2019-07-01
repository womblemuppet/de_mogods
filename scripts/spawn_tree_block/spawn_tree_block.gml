/***************************************************
  spawn_tree_block(x,y)
****************************************************/

 
var a;
a=instance_create(argument0,argument1,tree_block)   //if change this change room spawn blocks
a.protection=0
a.sprite_index=block_pineapple
a.variant=choose(5,17)
a.divisible=false



with a
{
    blockchunktype=aizen.chunk_type
}
return a
