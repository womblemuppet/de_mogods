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
a.gains_meter_on_hit=argument4
a.attackname=argument5


a.sprite_index=argument6
a.image_speed=argument7
a.alarm[0]=argument8


a.my_hknockback=argument9   ///knockback hspeed
a.my_vknockback=argument10






if image_xscale=-1
{
    a.direction=180
    a.image_xscale=-1       
}


return a
