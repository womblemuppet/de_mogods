var normalcol,hovercol;
normalcol=c_silver
hovercol=c_white
draw_set_colour(normalcol)
            
if readymenuselect[playerid]==0
	draw_set_colour(hovercol)
draw_text(menu_player_options_x[playerid]+150,menu_player_options_y[playerid]+100,"control scheme -")
		
var t;
if control_setup[playerid]=="kb_full"
	t="keyboard full"
else if control_setup[playerid]=="kb_left"
	t="keyboard narrow 1"
else if control_setup[playerid]=="kb_right"
	t="keyboard narrow 2"
else if control_setup[playerid]=="controller_default"
	t="controller default"
else if control_setup[playerid]=="controller_custom"
	t="controller custom 1"

draw_text(menu_player_options_x[playerid]+350,menu_player_options_y[playerid]+100,t)


draw_set_colour(normalcol)
if readymenuselect[playerid]==1
	draw_set_colour(hovercol)
draw_text(menu_player_options_x[playerid]+150,menu_player_options_y[playerid]+130,"hp")
if playerhandicap[playerid]==1
	draw_text(menu_player_options_x[playerid]+150,menu_player_options_y[playerid]+130,"+")
else if playerhandicap[playerid]==2
	draw_text(menu_player_options_x[playerid]+150,menu_player_options_y[playerid]+130,"++")

draw_set_colour(normalcol)
if readymenuselect[playerid]==2
	draw_set_colour(hovercol)

draw_text(menu_player_options_x[playerid]+150,menu_player_options_y[playerid]+150,"palette")
draw_text(menu_player_options_x[playerid]+350,menu_player_options_y[playerid]+150,string(palette[playerid]))