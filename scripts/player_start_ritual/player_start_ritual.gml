//prevent player from inputting LA+HA again
light_heavy_held_counter=-1000


//set player sprite
image_speed=FRAME_SPEED_NORMAL
sprite_index=sprites[? "ritual"]
image_index=0

ritual_lockdown=1

var a=effect_aniend(animation_cancel_effect_spr,0.2,-3);
a.y+=sprite_height
