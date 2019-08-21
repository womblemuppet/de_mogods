var xx,yy,subyy,area_height,area_xend,area_xstart,gap_height;
var mask_scale;
var mask_xoffset,mask_yoffset,pocket_xoffset,pocket_yoffset;
var meter_xoffset,meter_yoffset,meter_height,meter_length;


xx=0
yy=0
subyy=0
area_xend=kouchou.room_left_border_x   ///absolute
area_xstart=5  ////plus
area_height=250
gap_height=0
mask_scale=1.8
mask_xoffset=82   ///plus
mask_yoffset=15   ///plus
pocket_xoffset=185  ////plus
pocket_yoffset=170  ///plus
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
		draw_set_colour(c_lime)
		subyy=yy+(area_height+gap_height)*v//+area_height
		draw_sprite(arcade_cabinet_scorebar,0,xx+area_xstart,yy+(    (area_height+gap_height)*v    ))   
		draw_sprite_ext(player_hp_glow_spr[v],floating_masks_subimage,xx+area_xstart+mask_xoffset,subyy+mask_yoffset,mask_scale,mask_scale,0,c_white,1)
		
		draw_sprite_ext(hud_floatingoogamask,floating_masks_subimage,xx+area_xstart+mask_xoffset,subyy+mask_yoffset,mask_scale,mask_scale,0,c_white,1)
		
		draw_sprite(pocket_circle_sprite[v],pocket_circle_subimage[v],xx+area_xstart+pocket_xoffset,subyy+pocket_yoffset)
		
		if player_pocket_orb_sprite[v]!=-1
			draw_sprite(player_pocket_orb_sprite[v],0,xx+area_xstart+pocket_xoffset,subyy+pocket_yoffset)
		
		draw_set_colour(METER_BACKGROUND_COLOUR)
		draw_rectangle(xx+area_xstart+meter_xoffset,subyy+meter_yoffset,xx+area_xstart+meter_xoffset+meter_length,subyy+meter_yoffset+meter_height,false)
		
		
		draw_text(area_xend-50,subyy+190,string_hash_to_newline("orbs"+string(player_orb_count[v])))
		draw_text(area_xend-50,subyy+210,string_hash_to_newline("wins"+string(kouchou.playerwins[v])))
	}
	else
		draw_sprite(arcade_cabinet_scorebar_inactive,0,xx+area_xstart,yy+(    (area_height+gap_height)*v    ))
}