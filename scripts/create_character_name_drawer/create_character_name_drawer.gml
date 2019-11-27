var playerId,a;
playerId=argument0

var characterid;
characterid=selected_character_id[playerId]

current_character_name_drawer[playerId]=instance_create_depth(menu_player_character_title_x[playerId],menu_player_character_title_y[playerId],-75,character_name_drawer)
a=current_character_name_drawer[playerId]
a.mode="normal"
a.alpha=1
a.text=character_names[characterid]

return a