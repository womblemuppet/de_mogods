var playerId
playerId=argument0

var a;
a=instance_create_depth(menu_player_options_box_x[playerId],menu_player_options_box_y[playerId],-100,character_select_options_box)
a.playerId=playerId
a.control_setup_text=convert_contol_setup_to_display_text(control_setup[playerId])
a.handicap_icon=convert_handicap_amount_to_icon_spr(playerhandicap[playerId])
a.palette_number=palette[playerId]

return a