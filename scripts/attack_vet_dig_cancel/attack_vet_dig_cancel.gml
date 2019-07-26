

/***************************************************
  create_terrain_cutter(mask, type,  dir, speed )
  type is a string
  current types   (list may not be up to date, check block_take_damage)  :
  "hit"
  "gilded"
  "disintegrated"
  "pushed"
****************************************************/

create_terrain_cutter(eightysq_semicircle1,"pushed",90,3)
if !place_meeting(x,y-40,block)
	y-=40