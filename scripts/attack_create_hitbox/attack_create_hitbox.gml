/***************************************************
  attack_create_hitbox(stun amount, number of hh, reset attacker hh, reset opponent,attack name,sprite,image speed,active steps,hkb,vkb,super)
****************************************************/

var a;
a=instance_create_depth(x,y,-10,hitbox)

a.creator=self.id  
a.target=self.id

a.stunamount=argument0
a.numberofhh=argument1
a.reset_attacker_hh=argument2
a.reset_opponent=argument3
a.attack_name=argument4

if right
{
	a.image_xscale=scale
}
else
{
	a.image_xscale=-scale
	a.direction=180
}

a.image_yscale=scale


a.sprite_index=argument5
a.image_speed=argument6
a.alarm[0]=argument7


a.my_hknockback=argument8   ///knockback hspeed
a.my_vknockback=argument9

a.super_amount=argument10


with a
{
	hit[kouchou.MAX_PLAYER_COUNT]=false
	for (var i=0; i<kouchou.MAX_PLAYER_COUNT; i+=1)
	{
		hit[i]=false
	};
}



return a
