var player_hud_start_y_offset;
var hp_xoffset,hp_yoffset;





player_hud_start_y_offset=15

hp_xoffset=0  //relative to HUDx and HUDy
hp_yoffset=10


///draw player hp
for (var P=0; P<kouchou.MAX_PLAYER_COUNT; P++)
{
	if player_HUD_enabled[P]==true
		draw_sprite(spr_health_bar,0,HUDx[P]+hp_xoffset,HUDy[P]+hp_yoffset)
}


