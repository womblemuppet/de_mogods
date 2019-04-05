hspd=0
STUNNED2=argument0 
player_flush_lockdowns()
if argument1
{
    sprite_index=sprites[19]
    if supers>0
        sprite_index=sprites[20]
    image_speed=0.08
    var a;
    a=instance_create(x,y-11,ef_stunspiral)
    a.offsetx=0
    a.offsety=0
    a.targ=self.id
    a.image_xscale=image_xscale
    a.image_yscale=image_yscale
}
