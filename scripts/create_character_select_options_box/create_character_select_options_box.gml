var playerid
playerid=argument0

var a;
a=instance_create_depth(menu_player_options_box_x[playerid],menu_player_options_box_y[playerid],-100,character_select_options_box)
a.playerid=playerid
a.control_setup_text=convert_contol_setup_to_display_text(control_setup[playerid])
a.handicap_icon=convert_handicap_amount_to_icon_spr(playerhandicap[playerid])
a.palette_number=palette[playerid]

return a