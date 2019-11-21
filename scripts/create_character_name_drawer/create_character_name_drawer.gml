var playerid,a;
playerid=argument0

var characterid;
characterid=selected_character_id[playerid]

current_character_name_drawer[playerid]=instance_create_depth(menu_player_character_title_x[playerid],menu_player_character_title_y[playerid],-75,character_name_drawer)
a=current_character_name_drawer[playerid]
a.mode="normal"
a.alpha=1
a.text=character_names[characterid]

return a