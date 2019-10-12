///resets combo_hit_count for every character that hit this player
for (var i = 0; i < ds_list_size(combo_text_controller.all_characters_hit_by_in_combo[P]); i++) 
{
	var attacker_P;
	attacker_P=ds_list_find_value(combo_text_controller.all_characters_hit_by_in_combo[P],i).P
	combo_text_controller.combo_hit_count[attacker_P]=0
}

//then resets list of those players
ds_list_clear(combo_text_controller.all_characters_hit_by_in_combo[P])
