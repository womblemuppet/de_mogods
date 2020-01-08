var p_sprite,p_sprite_die;


var yy,block_column_number,prop_list;
yy=argument0
block_column_number=argument1
prop_list=argument2



var new_prop_properties;
new_prop_properties=decide_prop_properties(biome,prop_list)


var p_sprite,p_sprite_die,p_name,p_isFlag,p_cutTerrain,p_NOconnectors;
p_sprite=new_prop_properties.p_sprite
p_sprite_die=new_prop_properties.p_sprite_die
p_name=new_prop_properties.p_name
p_isFlag=new_prop_properties.p_isFlag
p_cutTerrain=new_prop_properties.p_cutTerrain
p_NOconnectors=new_prop_properties.p_NOconnectors

prop_create(kouchou.room_left_border_x+block_column_number*aizen.bw,yy,p_sprite,p_sprite_die,p_name,p_isFlag,p_cutTerrain,p_NOconnectors)

with new_prop_properties
	instance_destroy()