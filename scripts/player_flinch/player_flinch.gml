if groundcheck==noone
	cars2=0
	
recoil_sprite_counter=argument0

var pass;
pass=false

for (var i=0; i<ds_list_size(sprites_below_recoil_priority); i+=1)
{
	if ds_map_find_value(sprites,sprites_below_recoil_priority[| i])==sprite_index
	{
		pass=true
		break;
	}
};

if pass==false
{
	for (var i=0; i<ds_list_size(recoiling_sprites); i+=1)
	{
		if ds_map_find_value(sprites,recoiling_sprites[| i])==sprite_index
		{
			pass=true
			break;
		}
	};
}

if pass 
	player_set_flinch_sprites() 


