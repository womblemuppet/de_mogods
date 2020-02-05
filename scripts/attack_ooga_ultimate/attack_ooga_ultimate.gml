player_end_super_mode()

player_update_super_meter_hud()

////explosion effect
with effect_aniend(ooga_ultimate_groundpoundboom,0.2,-8)
{
	image_xscale=2
	image_yscale=2
}
instance_create(x,y,jump_vibration)



///two hitboxes
var a;
a=attack_create_hitbox(200,0,false,true,"uga_gp_ult_shockwave",ooga_ultimate_groundpound_shockwave_hitbox,0.2,99,1,3,0)
a.direction=0
a.image_xscale=1
with a
	instance_change(ooga_gp_shockwave,true)

a=attack_create_hitbox(200,0,false,true,"uga_gp_ult_shockwave",ooga_ultimate_groundpound_shockwave_hitbox,0.2,99,1,3,0)
a.direction=180
a.image_xscale=-1
with a
	instance_change(ooga_gp_shockwave,true)



///big explosion terrain cutter
create_terrain_cutter(ooga_ultimate_groundpound_hitbox,"hit",90,7)


