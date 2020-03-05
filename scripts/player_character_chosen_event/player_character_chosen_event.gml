var playerId;
playerId=argument0

//create options box
character_select_options_box_id[playerId]=create_character_select_options_box(playerId)

//create character portrait
character_portraits_components[playerId]=create_menupart_generic(character_portraits_array[selected_character_id[playerId]],0.2,charpor_x[playerId],charpor_y[playerId],-100,undefined)
//flip character portrait for players on left side
if playerId mod 2 ==0
{
	character_portraits_components[playerId].x+=character_portraits_components[playerId].sprite_width
	character_portraits_components[playerId].image_xscale=-1
}


//kill select spirit
with select_spirits_ids[playerId]
{
	dying=true
	sprite_index=character_select_player_spirit_die
}
