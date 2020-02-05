var class,hitbox_properties_script,new_speed;
class=argument0
hitbox_properties_script=argument1
new_speed=argument2


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
a.speed=new_speed

return a