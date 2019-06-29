if other.creator!=self.id 
{
	var a;
	a=instance_create(x,y,ef_stunspiral)
	a.image_speed=0.1
	a.targ=self.id
	a.sprite_index=other.hit_sprite
	a.offsetx=0
	a.offsety=0
	show_stun_animation=true
	player_get_stunned(85)
	with other
		instance_destroy()
}

