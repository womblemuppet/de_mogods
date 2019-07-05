if !dying
{
	if sprite_index==birth_sprite
	{
		sprite_index=normal_sprite
		image_speed=0.15
		ready=true  
	}
}
if sprite_index==death_sprite
{
	instance_destroy()
}

