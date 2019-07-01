last_active_frame=0
image_speed=0.3


var a;
a=instance_create_depth(x,y,-4,ef_follower)
a.targ=self.id
a.offsetx=0
a.offsety=0
a.sprite_index=sprite_index
a.image_speed=image_speed
//effect_aniend(sprite_index,0.3,-10)


