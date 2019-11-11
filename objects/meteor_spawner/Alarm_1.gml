ammo-=1

if ammo>0
{
	var a;
	a=instance_create_depth(kouchou.room_left_border_x+(random(kouchou.rw)/40)*40,0,0,meteor)
	a.hspeed=-0.5+random(1)
}
else
	instance_destroy()


alarm[1]=30