instance_activate_object(creator)
creator.x=x
creator.y=y
creator.uniques_dashgpblinkattack_lockdown=0
with creator
{
	sprite_index=sprites[? "gpfall"]   ///groundpound freeze sprite
	if super_mode
		sprite_index=sprites[? "gpfall_u"]
	attack_start_groundpound_descent()
}
instance_destroy()