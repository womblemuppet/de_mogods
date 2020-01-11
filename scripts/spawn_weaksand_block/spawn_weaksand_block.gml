/***************************************************
  spawn_weaksand(x,y)
****************************************************/

 
var a;
a=instance_create(argument0,argument1,weaksand)   //if change this change room spawn blocks
a.sprite_index=weaksand_sprite
a.variant=choose(5,17)
a.divisible=false
a.die_hit_sprite=weaksand_sprite_die
a.die_disintegrated_sprite=weaksand_sprite_die
a.die_pushed_sprite=weaksand_sprite_die
a.die_debris_sprite=weaksand_sprite_debris
a.die_debris_sprite_die=weaksand_sprite_debris_die

with a
{
    chunk_name_at_spawn_time=aizen.current_chunk_name
}
return a
