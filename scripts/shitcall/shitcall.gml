/***************************************************
  shitcall(delay timer amount,kill orbs)
  stops additional orbs from being spawned, starts timer for first elemental effect, sets mode variable to 1
****************************************************/



screenshake(5,12)
if argument1
{
	with orbb
	{
		effect_create_above(ef_firework,x,y,0,c_fuchsia)
		instance_destroy()
	}
}
mode=1
alarm[1]=argument0



effect_create_above(ef_firework,room_width/2,room_height/2,2,c_red)
