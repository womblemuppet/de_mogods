/***************************************************
  attack_create_dash_hitbox(bunts,stun amount,horizontal kb, vertical kb,attack name,sprite index,image speed,stops dasher on contact,cuts terrain)
****************************************************/
var a;
a=instance_create(x,y,dashattack)
a.creator=self.id  
a.target=self.id

a.bunts=argument0
a.my_stunamount=argument1
a.my_hknockback=argument2   ///knockback hspeed
a.my_vknockback=argument3
a.attack_name=argument4
a.sprite_index=argument5
a.image_speed=argument6
a.stops_dasher_on_contact=argument7
a.cuts_terrain=argument8

if !right
{
	a.image_xscale=-1
	a.direction=180
}


a.dir=a.direction   ///for block_take_damage script
a.spd=6                    ///for block_take_damage script

a.x=round(x/4)*4
a.y=round(y/4)*4


return a
