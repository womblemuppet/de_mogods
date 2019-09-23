stack_add_orb(0,true)


number_of_pockets-=1

if pocket_super_mode_stored
{
	player_activate_super_mode()
	pocket_super_mode_stored=false
}

player_update_pocket_hud()



pocket_light_heavy_held_counter=-1000

player_flush_lockdowns()
sprite_index=sprites[? "envoke"]
image_index=0

var a=effect_aniend(animation_cancel_effect_spr,0.2,-3);
a.y+=sprite_height
