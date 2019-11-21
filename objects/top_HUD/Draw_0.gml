var xx,player_hud_start_y_offset;
var hp_xoffset,hp_yoffset;





player_hud_start_y_offset=15

hp_xoffset=20  //relative to HUDx[v]
hp_yoffset=20  //relative from player_hud_start_y_offset


//////////////////////// DRAW PLAYER HP/ORBS


for (var v=0; v<kouchou.MAX_PLAYER_COUNT; v+=1)
{
	if player_HUD_enabled[v]==true
	{
		xx=HUDx[v]
		draw_sprite(spr_health_bar,0,xx,player_hud_start_y_offset)   
		draw_text(xx+hp_xoffset,player_hud_start_y_offset+hp_yoffset,player_hp[v])
	}
}


