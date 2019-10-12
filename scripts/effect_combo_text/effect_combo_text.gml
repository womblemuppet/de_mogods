var target_player;
target_player=argument0

if !instance_exists(target_player)
exit


var COMBO_TEXT_DEPTH;
COMBO_TEXT_DEPTH=-10

var a;
a=instance_create_depth(0,0,COMBO_TEXT_DEPTH,ef_combo_text)
a.type=argument1
a.targ=argument0


if argument1=="combo"
{
	a.sprite_index=combo_sprites[target_player.P]
	a.x=top_HUD.cc_text_location_combo_x[target_player.P]
	a.y=top_HUD.cc_text_location_combo_y
	
	var b;
	b=instance_create_depth(top_HUD.cc_text_location_combo_numbers_x[target_player.P],top_HUD.cc_text_location_combo_y,COMBO_TEXT_DEPTH,ef_combo_text)
	b.sprite_index=combo_number_sprites[combo_hit_count[target_player.P]-2]
	b.type=argument1
	b.targ=argument0
}
else if argument1=="volley"
{
	a.sprite_index=volley_sprites[target_player.P]
	a.x=top_HUD.cc_text_location_secondary_x[target_player.P]
	a.y=top_HUD.cc_text_location_secondary_y
}
else if argument1=="cucked"
{
	a.sprite_index=denied_sprites[target_player.P]
	a.x=top_HUD.cc_text_location_secondary_x[target_player.P]
	a.y=top_HUD.cc_text_location_secondary_y
}