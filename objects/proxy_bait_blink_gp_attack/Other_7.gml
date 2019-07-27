instance_activate_object(creator)
creator.x=x
creator.y=y
creator.uniques_dashgpblinkattack_lockdown=0
with creator
{
	sprite_index=sprites[5]   ///groundpound freeze sprite
	if super_mode
		sprite_index=sprites[7]
	attack_start_groundpound_descent()
}
instance_destroy()