var target_player;
target_player=argument0

if !instance_exists(target_player)
exit


var a;
a=instance_create_depth(target_player.x,combo_text_controller.COMBO_TEXT_Y_VALUE,1,ef_combo_text)
a.targ=target_player
a.type=argument1




if argument1=="combo"
{
	a.sprite_index=combo_sprites[target_player.P]
}
else if argument1=="volley"
{
	a.sprite_index=volley_sprites[target_player.P]
}
else if argument1=="cucked"
{
	a.sprite_index=denied_sprites[target_player.P]
}