var class,hitbox_properties_script,new_hspeed;
class=argument0
hitbox_properties_script=argument1
new_hspeed=argument2


var a;
a=instance_create_depth(x,y+25,-2,class)
a.hitbox_properties_script=hitbox_properties_script
a.right=right
a.creator=self.id
if !right
{
	a.image_xscale=-1
	a.direction=180
}
a.speed=new_hspeed

return a