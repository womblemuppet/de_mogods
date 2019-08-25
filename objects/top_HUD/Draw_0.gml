var xx,yy,area_height,area_width,gap_width,area_xend,area_xstart;
var mask_scale;
var mask_xoffset,mask_yoffset,pocket_xoffset,pocket_yoffset;
var meter_xoffset,meter_yoffset,meter_height,meter_length;

yy=0
area_xend=kouchou.room_left_border_x   ///absolute
area_xstart=5  ////plus
area_width=PLAYER_HUD_AREA_WIDTH
area_height=250
gap_width=20
mask_scale=1.8
mask_xoffset=82   ///plus
mask_yoffset=15   ///plus
pocket_xoffset=140  ////plus
pocket_yoffset=100  ///plus
meter_length=140
meter_xoffset=70  ///plus
meter_yoffset=235  ///plus
meter_height=10

draw_set_font(font_scoreboard)

for (var v=0; v<kouchou.MAX_PLAYER_COUNT; v+=1)
{
	if player_HUD_enabled[v]==true
	{
		xx=HUDx[v]
		draw_sprite(arcade_cabinet_scorebar,0,xx,yy)   
		draw_sprite(pocket_circle_sprite[v],pocket_circle_subimage[v],xx+pocket_xoffset,yy+pocket_yoffset)
		
		if player_pocket_orb_sprite[v]!=-1
			draw_sprite(player_pocket_orb_sprite[v],0,xx+pocket_xoffset,yy+pocket_yoffset)
	}
}