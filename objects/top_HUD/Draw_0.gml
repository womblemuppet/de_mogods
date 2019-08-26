var xx,yy,area_height,area_width,gap_width,area_xend,area_xstart;
var hp_xoffset,hp_yoffset;
var mask_scale,mask_xoffset,mask_yoffset;
var pocket_xoffset,pocket_yoffset;


yy=0
area_xend=kouchou.room_left_border_x   ///absolute
area_xstart=5  ////plus
area_width=PLAYER_HUD_AREA_WIDTH
area_height=250
gap_width=20

hp_xoffset=45
hp_yoffset=45

pocket_xoffset=152  ////plus
pocket_yoffset=51  ///plus

mask_scale=1.8   //[finaledit] scale=bad
mask_xoffset=105   ///plus
mask_yoffset=50   ///plus



draw_set_font(font_scoreboard)

for (var v=0; v<kouchou.MAX_PLAYER_COUNT; v+=1)
{
	if player_HUD_enabled[v]==true
	{
		xx=HUDx[v]
		draw_sprite(arcade_cabinet_scorebar,0,xx,yy)   
		draw_text(xx+hp_xoffset,yy+hp_yoffset,player_hp[v])
		draw_sprite(pocket_circle_sprite[v],pocket_circle_subimage[v],xx+pocket_xoffset,yy+pocket_yoffset)
		
		if player_pocket_orb_sprite[v]!=-1
			draw_sprite(player_pocket_orb_sprite[v],0,xx+mask_xoffset,yy+mask_yoffset)
	}
}