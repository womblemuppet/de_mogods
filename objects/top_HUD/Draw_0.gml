var xx,yy,subyy,area_height,area_xend,area_xstart,gap_height;
var mask_scale;
var mask_xoffset,mask_yoffset,pocket_xoffset,pocket_yoffset;
var meter_xoffset,meter_yoffset,meter_height,meter_length;


xx=kouchou.room_left_border_x
yy=0
area_xend=kouchou.room_left_border_x   ///absolute
area_xstart=5  ////plus
area_width=260
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
draw_sprite_ext(arcade_cabinet,0,kouchou.room_left_border_x,0,-1,1,0,c_white,1)


for (v=0; v<kouchou.MAX_PLAYER_COUNT; v+=1)
{
	if player_HUD_enabled[v]==true
	{
		subxx=xx+(area_width+gap_width)*v
		draw_sprite(arcade_cabinet_scorebar,0,subxx,yy)   
		//draw_sprite_ext(player_hp_glow_spr[v],floating_masks_subimage,subxx+mask_xoffset,yy+mask_yoffset,mask_scale,mask_scale,0,c_white,1)
		
		//draw_sprite_ext(hud_floatingoogamask,floating_masks_subimage,subxx+mask_xoffset,yy+mask_yoffset,mask_scale,mask_scale,0,c_white,1)
		
		draw_sprite(pocket_circle_sprite[v],pocket_circle_subimage[v],subxx+pocket_xoffset,yy+pocket_yoffset)
		
		if player_pocket_orb_sprite[v]!=-1
			draw_sprite(player_pocket_orb_sprite[v],0,subxx+pocket_xoffset,yy+pocket_yoffset)
	}
}