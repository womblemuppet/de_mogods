player_update_super_meter_hud()

set_hud_pocket_circle_orb_normal()
player_end_super_mode()


effect_aniend(ooga_ultimate_groundpoundboom,0.2,-2)
instance_create(x,y,jump_vibration)

var a;
a=attack_create_hitbox(200,0,false,true,"uga_gp_ult_shockwave",ooga_ultimate_groundpound_shockwave_hitbox,0.2,99,1,3)
a.direction=0
a.image_xscale=1
with a
	instance_change(ooga_gp_shockwave,true)

a=attack_create_hitbox(200,0,false,true,"uga_gp_ult_shockwave",ooga_ultimate_groundpound_shockwave_hitbox,0.2,99,1,3)
a.direction=180
a.image_xscale=-1
with a
	instance_change(ooga_gp_shockwave,true)



///big explosion terrain cutter
create_terrain_cutter(ooga_ultimate_groundpound_hitbox,"hit",90,7)

///two horizontal moving terrain cutters
var a;
for (var i = 0; i <180 ;i+=aizen.bw) 
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
