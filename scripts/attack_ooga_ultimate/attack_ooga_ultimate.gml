unique_ooga_gp_charges-=1
player_update_super_meter_hud()

if unique_ooga_gp_charges<1    //if no more charges, end super mode (by setting ult timer to last tick)
	super_mode_time_remaining=1
instance_create(x,y,jump_vibration)

var a;
a=instance_create(x,y,ooga_gp_boom)
a.hit=false
a.creator=self.id
with a
{
	var b;
	b=instance_create(x,y,ooga_gp_shockwave)
	b.hit=false
	b.creator=creator
	b=instance_create(x,y,ooga_gp_shockwave)
	b.image_xscale=-1
	b.direction=180
	b.creator=creator
	b.hit=false
}
create_terrain_cutter(ooga_ultimate_groundpoundboom,"hit",90,7)

alarm[7]=1