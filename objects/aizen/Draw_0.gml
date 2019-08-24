   
//if debug     ////debug information drawing
//{
//	draw_set_font(font_debug)
//	draw_text(kouchou.room_left_border_x+150,50,string_hash_to_newline("travelled: "+string(travelled)))
//	draw_text(kouchou.room_left_border_x+150,80,string_hash_to_newline("peacetime: "+string(peacetime)))
//	draw_set_colour(c_lime)
//	draw_line(0,player_baseline,room_width,player_baseline)
//	draw_set_colour(c_green)
//	draw_text(400,400,number_of_tergenned_lines)
//	draw_set_colour(c_yellow)
//	draw_text(400,500,total_baseline_movement)
//}


if kouchou.map=="firetrial" || kouchou.map=="icetrial"
{
	draw_set_font(font_score)
	draw_text(60,60,string_hash_to_newline(string(scoer)))
}


if fossil_surface_redraw_needed
	redraw_fossil_surface() 

draw_blocks_and_fossils()

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/////draw bounds warning line
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

var draw;
draw=false

for (var i=0; i<instance_number(player); i+=1)  //[finaledit] optimize
{
	if instance_find(player,i).y<50
	{
		draw=true
		break;
	}
};
if draw
{
	for (var i=kouchou.room_left_border_x; i<kouchou.room_right_border_x; i+=50)
	{
		draw_sprite(bound_warning_sprite,top_of_screen_warning_subimage,i,0)
	};
}







///hud



var xx,yy;
xx=0
yy=0

//////////////////////////////////////////////////////////////////////////////////////// RIGHT SIDE (BAR)
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////                draw orb stack             ////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


xx=kouchou.room_right_border_x+90   ///xx and yy    - position to start drawing orb stack masks from
yy=kouchou.room_top_border_y


//////////////////////////////////////////////////////////////////////////////       draw stack background
draw_sprite(arcade_cabinet,0,kouchou.room_right_border_x,0)
draw_sprite_ext(arcade_cabinet_rightborder,0,kouchou.room_left_border_x+5,0,-1,1,0,c_white,1)
draw_sprite(arcade_cabinet_rightborder,0,kouchou.room_right_border_x-5,0)

draw_sprite(stackframe_sprite,stackframe_subimage,kouchou.room_right_border_x+17,125)

//////////////////////////////////////////////////////////////////////////////////////// fb indicator (patchy)
if aizen.first_blood_status=="none"
	draw_sprite(fbindicatorsprite_red,0,xx-20,y+15)


//////////////////////////////////////////////////////////////////////////////       draw stack masks
for (var i=0; i<ds_list_size(STACK); i+=1)
{
	draw_sprite_ext(ds_list_find_value(STACK_ORB_SPRITES,ds_list_find_value(STACK,i)),0,xx+2,yy+210+ds_list_size(STACK)+i*150,3.75,3.75,0,c_white,1)
};
if last_stack_sprite!=-1
{
	draw_sprite_ext(last_stack_sprite,image_index,xx,yy+ds_list_size(STACK)+40,2,2,0,c_white,1)
	draw_sprite_ext(active_effect_line,0,xx,yy-50,1,1.75,0,c_white,1)    
}


if kouchou.setmenu_show_fps
{
	if fps_real>80
	{
		draw_set_color(c_white)    
		draw_text(kouchou.room_left_border_x+40,kouchou.room_top_border_y+20,string_hash_to_newline(string(round(fps_real/10)*10)+" fps"))
	}
	else
	{
		draw_set_color(c_red)
		draw_text(kouchou.room_left_border_x,kouchou.room_top_border_y,string_hash_to_newline(string(round(fps_real))+" fps"))
	}
    
	//if debug
	//	draw_text(kouchou.room_left_border_x,kouchou.room_top_border_y+35,string_hash_to_newline(string(round(instance_count/25)*25)+"("+string(instance_number(block))+")"))
}   




 