/***************************************************
  spawn_block(x,y)
****************************************************/
 

 
var a;
a=instance_create(argument0,argument1,block)   //if change this change room spawn blocks
a.visible=true
a.variant=choose(5,17)
a.divisible=true
a.image_xscale=aizen.bw/40
a.image_yscale=aizen.bh/40

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
	if random(1)>0.9925
		instance_create(argument0+10+random(20),argument1+aizen.bh+1,ef_vine)
}

return a
