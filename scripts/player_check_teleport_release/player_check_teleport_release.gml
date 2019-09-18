if checkkey_released(downbutton)
{ ////// down button hold counter reset (for abilities like place mine)
	if sprite_index==sprites[? "uniques_place_teleport"] || sprite_index=sprites[? "uniques_use_teleport"]
	{
		player_set_idle()
	}
}