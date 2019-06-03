/***************************************************
  spawn block(x,y)
****************************************************/
 

// if updating this also update spawn_gunpowder_block *****************************************
//   *********************************************  ///////

 
var a;
a=instance_create(argument0,argument1,block)   //if change this change room spawn blocks
a.visible=true
a.protection=0
a.variant=choose(5,17)
a.divisible=true

if argument2==0
{
	 a.blockchunktype=aizen.chunk_type
}
//else
//	a.blockchunktype=blockchunktype

with a
{
	block_setup_sprites()
}




if aizen.biome=="forest"   ///create vines
{
	if random(1)>0.9
		instance_create(argument0+10+random(20),argument1+41,ef_vine)
}

return a
