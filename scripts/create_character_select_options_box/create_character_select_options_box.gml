var playerid
playerid=argument0

var a;
a=instance_create_depth(menu_player_options_x[playerid],menu_player_options_y[playerid],-100,character_select_options_box)
a.playerid=playerid
return a