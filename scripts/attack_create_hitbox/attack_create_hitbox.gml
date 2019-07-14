/***************************************************
  -attack_create_hitbox(stun amount, number of hh, reset attacker hh, reset opponent,gain meter on hit,attack name,sprite,image speed,active steps,hkb,vkb)
****************************************************/

var a;
a=instance_create(x,y,hitbox)
a.creator=self.id  
a.target=self.id

a.stunamount=argument0
a.numberofhh=argument1
a.reset_attacker_hh=argument2
a.reset_opponent=argument3
a.attack_name=argument4


a.sprite_index=argument5
a.image_speed=argument6
a.alarm[0]=argument7


a.my_hknockback=argument8   ///knockback hspeed
a.my_vknockback=argument9






if image_xscale=-1
{
	a.direction=180
	a.image_xscale=-1       
}


return a
