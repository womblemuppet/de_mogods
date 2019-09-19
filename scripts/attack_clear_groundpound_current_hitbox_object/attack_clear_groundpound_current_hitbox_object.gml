//delete groundpound hitbox
if groundpound_current_hitbox_object!=noone
{
	if instance_exists(groundpound_current_hitbox_object)
	{
		with groundpound_current_hitbox_object
			instance_destroy()
	}
	groundpound_current_hitbox_object=noone
}
