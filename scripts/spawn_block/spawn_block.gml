/***************************************************
  spawn_block(x,y)
****************************************************/
 

 
var a;
a=instance_create(argument0,argument1,block)   //if change this change room spawn blocks
a.visible=true
a.variant=choose(5,17)
a.divisible=true
a.chunk_name_at_spawn_time=aizen.current_chunk_name


with a
{
	block_setup_sprites()
}




return a
