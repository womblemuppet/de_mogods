///resets combo_hit_count for every character that hit this player
for (var i = 0; i < ds_list_size(combo_text_controller.all_characters_hit_by_in_combo[P]); i++) 
{
	var attacker_P;
	attacker_P=ds_list_find_value(combo_text_controller.all_characters_hit_by_in_combo[P],i).P
	combo_text_controller.combo_hit_count[attacker_P]=0
	show_debug_message("reset combo of "+string(attacker_P))
	with ef_combo_text
	{
		if instance_exists(targ)
		{
			if targ.P==attacker_P
			{
				fading=true
				if type=="combo"
					sprite_index=combo_text_controller.combo_sprites_faded[attacker_P]
				else if type=="number"
				{
					sprite_index=combo_text_controller.combo_sprites_faded[attacker_P]
				}
				image_index=0
			}
		}
	}

}

//then resets list of those players
ds_list_clear(combo_text_controller.all_characters_hit_by_in_combo[P])

