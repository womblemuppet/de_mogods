/***************************************************
  spawn block(x,y,part)
  parts can only spawn from the destroyed block instance
****************************************************/
 

// if updating this also update spawn_gunpowder_block *****************************************
//   *********************************************  ///////

 
var a;
a=instance_create(argument0,argument1,block)   //if change this change room spawn blocks
ds_list_add(aizen.blockstosprite,a)
a.part=argument2
a.visible=true
a.protection=0
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
