recoil_sprite_counter=10
var pass;
pass=false
for (var i=0; i<ds_list_size(sprites_below_recoil_priority); i+=1)
{
	if ds_map_find_value(sprites,sprites_below_recoil_priority[| i])==sprite_index
	{
		pass=true
		break;  //[finaledit] could be exit
	}
};

if pass
{  
	image_index=0
	sprite_index=sprites[? "recoiling"]
	if super_mode
		sprite_index=sprites[? "recoiling_u"]    
}

