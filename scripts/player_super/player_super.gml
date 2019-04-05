supers-=1
aizen.playersupercount[P]-=1

if supers<1
    aizen.playerulttimeindex[P]=17
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
