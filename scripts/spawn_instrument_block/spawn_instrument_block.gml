/***************************************************
  spawn_instrument_block(x,y,spawn meteor please)
  called by the block chosen by spawn_instrument
  returns the created instance id
****************************************************/

//show_message("spawn instrument called, x="+string(argument0)+" y="+string(argument1))
 
var a;
a=instance_create(argument0,argument1,instrument)   //if change this change room spawn blocks
a.variant=0
a.divisible=false
if argument2
	a.type=0
else
	a.type=choose(1,1,2,2,4,5)
	
a.sprite_index=convert_orb_type_to_sprite(a.type)
 

with a
{
	blockchunktype=aizen.chunk_type
}
return a
