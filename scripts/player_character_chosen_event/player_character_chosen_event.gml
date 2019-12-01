var playerId;
playerId=argument0

character_select_options_box_id[playerId]=create_character_select_options_box(playerId)


with select_spirits_ids[playerId]
{
	dying=true
	sprite_index=character_select_player_spirit_die
}
