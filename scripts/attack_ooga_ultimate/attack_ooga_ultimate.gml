unique_ooga_gp_charges-=1
player_update_super_meter_hud()

if unique_ooga_gp_charges<1    //if no more charges, end super mode (by setting ult timer to last tick)
	player_end_super_mode()

effect_aniend(ooga_ultimate_groundpoundboom,0.2,-2)
instance_create(x,y,jump_vibration)

var a;
a=instance_create(x,y,ooga_gp_shockwave)
a.hit=false
a.creator=self.id
a=instance_create(x,y,ooga_gp_shockwave)
a.image_xscale=-1
a.direction=180
a.creator=self.id
a.hit=false

create_terrain_cutter(ooga_ultimate_groundpoundboom,"hit",90,7)

var a;
for (var i = 0; i <180 ;i+=40) 
{
	a = create_terrain_cutter(ooga_ultimate_shockwave_cutter,"disintegrated",i,5)
	a.direction=i
	a.speed=6
	a.image_angle=i
	a.alarm[0]=15
	a=effect_aniend(ooga_ultimate_shockwave_cutter,0.2,-2)
	a.direction=i
	a.speed=6
	a.image_angle=i
}

alarm[7]=1