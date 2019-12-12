var p_sprite,p_sprite_die;


var yy,block_column_number;
yy=argument0
block_column_number=argument1



var new_prop_properties;
new_prop_properties=decide_prop_properties(biome)


var p_sprite,p_sprite_die,p_name,p_isFlag,p_cutTerrain;
p_sprite=new_prop_properties.p_sprite
p_sprite_die=new_prop_properties.p_sprite_die
p_name=new_prop_properties.p_name
p_isFlag=new_prop_properties.p_isFlag
p_cutTerrain=new_prop_properties.p_cutTerrain

prop_create(kouchou.room_left_border_x+block_column_number*aizen.bw,yy,p_sprite,p_sprite_die,p_name,p_isFlag,p_cutTerrain)

with new_prop_properties
	instance_destroy()