/***************************************************
  spawn_ice_block(x,y)
****************************************************/

 
var a;
a=instance_create(argument0,argument1,gunpowder)   //if change this change room spawn blocks
a.protection=0
a.sprite_index=gunny_full
a.part=argument2
a.variant=choose(5,17)
a.divisible=true

if argument2==0
{
        a.blockchunktype=aizen.chunk_type
}
else
    a.blockchunktype=blockchunktype
    
with a
{
    block_setup_sprites()
}

if argument2!=0
{
    a.sprite_index=sprite_index
}


if aizen.biome=="forest" && argument2==0    ///create vines
{
    if random(1)>0.9
        instance_create(argument0+10+random(20),argument1+41,ef_vine)
}
return a
