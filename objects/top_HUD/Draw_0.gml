var xx,player_hud_start_x_offset,player_hud_start_y_offset;
var hp_xoffset,hp_yoffset;




player_hud_start_x_offset=15
player_hud_start_y_offset=15

hp_xoffset=20  //relative to HUDx[v]
hp_yoffset=20  //relative from player_hud_start_y_offset


//////////////////////// DRAW PLAYER HP/ORBS

draw_set_font(font_scoreboard)

for (var v=0; v<kouchou.MAX_PLAYER_COUNT; v+=1)
{
	if player_HUD_enabled[v]==true
	{
		xx=HUDx[v]+player_hud_start_x_offset
		draw_sprite(arcade_cabinet_scorebar,0,xx,player_hud_start_y_offset)   
		draw_text(xx+hp_xoffset,player_hud_start_y_offset+hp_yoffset,player_hp[v])
	}
}


