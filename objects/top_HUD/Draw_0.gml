var xx,player_hud_start_x_offset,player_hud_start_y_offset;
var hp_xoffset,hp_yoffset;
var pocket_mask_scale,pocket_mask_xoffset,pocket_mask_yoffset,pocket_mask_gap_width;
var pocket_area_xoffset,pocket_area_yoffset;
var stack_hud_start_x,stack_hud_start_y,stack_mask_gap_width;
//var upcoming_stack_hud_start_x,upcoming_stack_hud_start_y,upcoming_stack_mask_interval_height;



player_hud_start_x_offset=15
player_hud_start_y_offset=15

hp_xoffset=20  //relative to HUDx[v]
hp_yoffset=20  //relative from player_hud_start_y_offset

pocket_area_xoffset=62  ////plus
pocket_area_yoffset=1  ///plus

pocket_mask_scale=1.8   //[finaledit] scale=bad
pocket_mask_xoffset=90   ///plus
pocket_mask_yoffset=30   ///plus
pocket_mask_gap_width=35

//////////////////////// DRAW PLAYER HP/ORBS

draw_set_font(font_scoreboard)

for (var v=0; v<kouchou.MAX_PLAYER_COUNT; v+=1)
{
	if player_HUD_enabled[v]==true
	{
		xx=HUDx[v]+player_hud_start_x_offset
		draw_sprite(arcade_cabinet_scorebar,0,xx,player_hud_start_y_offset)   
		draw_text(xx+hp_xoffset,player_hud_start_y_offset+hp_yoffset,player_hp[v])
		draw_sprite(pocket_circle_sprite[v],pocket_circle_subimage[v],xx+pocket_area_xoffset,player_hud_start_y_offset+pocket_area_yoffset)

		for (var i=0;i<4;i++)
		{
			if i<player_number_of_pockets[v]
				draw_sprite(orb_in_hud_spr,0,xx+pocket_mask_xoffset+i*pocket_mask_gap_width,player_hud_start_y_offset+pocket_mask_yoffset)
			//else draw no_orb_sprite
		}
	}
}

////////////////////DRAW STACK

stack_hud_start_x=kouchou.room_x_halfway-300
stack_hud_start_y=55
stack_mask_gap_width=125

for (var i=0; i<ds_list_size(aizen.STACK); i+=1)
{
	var orb_sprite;
	orb_sprite=aizen.STACK_ORB_SPRITES[? ds_list_find_value(aizen.STACK,i)]
	
	draw_sprite_ext(orb_sprite,0,stack_hud_start_x+stack_mask_gap_width*i,stack_hud_start_y,3.5,3.5,0,c_white,1)
};


////////////////////DRAW UPCOMING STACK

//upcoming_stack_hud_start_x=700
//upcoming_stack_hud_start_y=15
//upcoming_stack_mask_interval_height=30

//for (var i = 0; i < ds_list_size(aizen.UPCOMING_STACK_DISPLAY_NUMBER); i++)
//{
//	var orb_sprite;
//	orb_sprite=ds_list_find_value(aizen.STACK_ORB_SPRITES,ds_list_find_value(aizen.upcoming_stack,i))
	
//	draw_sprite_ext(orb_sprite,0,upcoming_stack_hud_start_x,upcoming_stack_hud_start_y+i*upcoming_stack_mask_interval_height,0.6,0.6,0,c_white,1)
//}

//if last_stack_sprite!=-1
//{
//	draw_sprite_ext(last_stack_sprite,image_index,xx,stack_hud_start_y+ds_list_size(STACK)+40,2,2,0,c_white,1)
//	draw_sprite_ext(active_effect_line,0,xx,stack_hud_start_y-50,1,1.75,0,c_white,1)    
//}



