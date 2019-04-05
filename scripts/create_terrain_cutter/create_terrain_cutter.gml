/***************************************************
  create_terrain_cutter(mask, type,  dir, speed )
  type is a string
  current types   (list may not be up to date, check block_take_damage)  :
  "hit"
  "gilded"
  "disintegrated"
  "pushed"
****************************************************/

var a;
a=instance_create(x,y,terrain_cutter)
a.sprite_index=argument0
a.type=argument1
a.dir=argument2
a.spd=argument3
return a


