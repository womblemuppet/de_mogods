//prevent player from inputting LA+HA again
light_heavy_held_counter=-1000


//set player sprite
player_flush_lockdowns()
sprite_index=sprites[? "ritual"]
image_index=0


var a=effect_aniend(animation_cancel_effect_spr,0.2,-3);
a.y+=sprite_height
