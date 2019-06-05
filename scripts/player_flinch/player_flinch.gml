recoil_sprite_counter=10
var pass;
pass=false
for (i=0; i<ds_list_size(sprites_below_recoil_priority); i+=1)
{
	if sprites[sprites_below_recoil_priority[| i]]==sprite_index
	{
		pass=true
		break;
	}
};

if pass
{  
	image_index=0
	sprite_index=sprites[25]
	if super_mode
		sprite_index=sprites[26]    
}

