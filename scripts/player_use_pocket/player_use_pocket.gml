stack_add_orb(undefined,true)


number_of_pockets-=1

player_update_pocket_hud()

if super_meter>=super_meter_max
	player_activate_super_mode()
else
	super_meter++

HUD_increment_super_bar(P)

//prevent player from inputting LA+HA again
pocket_light_heavy_held_counter=-1000


//set player sprite
player_flush_lockdowns()
sprite_index=sprites[? "envoke"]
image_index=0


//create pocket use effect
var a=effect_aniend(animation_cancel_effect_spr,0.2,-3);
a.y+=sprite_height
