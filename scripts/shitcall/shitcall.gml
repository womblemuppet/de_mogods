/***************************************************
  shitcall(delay timer amount)
	starts timer for first elemental effect, sets mode variable to 1
****************************************************/



screenshake(5,12)

mode=1
alarm[1]=argument0



spawn_pineapple()

effect_create_above(ef_firework,room_width/2,room_height/2,2,c_red)
