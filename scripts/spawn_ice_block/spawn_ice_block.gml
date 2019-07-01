/***************************************************
  spawn_ice_block(x,y)
****************************************************/


var a;
a=instance_create(argument0,argument1,ice_block)   //if change this change room spawn blocks
a.sprite_index=icecube_ice_trial
a.variant=choose(5,17)
a.divisible=false

with a
{
//    blockbi9ome=aizen.b9iome
}
return a
