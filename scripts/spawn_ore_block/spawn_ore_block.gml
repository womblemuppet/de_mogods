/***************************************************
  spawn_ore_block(x,y)
****************************************************/


var a;
a=spawn_instrument_block(argument0,argument1,false)
a.type=3
a.sprite_index=block_ore




/*
var a;
a=instance_create(argument0,argument1,ore_block)   //if change this change room spawn blocks
a.sprite_index=block_ore
a.variant=choose(5,17)
a.divisible=false

with a
{
	blockchunktype=aizen.chunk_type
}
return a
