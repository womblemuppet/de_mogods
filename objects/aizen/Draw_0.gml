   
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








//////////////////////////////////////////////////////////////////////////////////////// RIGHT SIDE (BAR)
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////                draw orb stack             ////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////



if kouchou.setmenu_show_fps
{
	if fps_real>300
	{
		draw_set_color(c_white)    
		draw_text(kouchou.room_left_border_x+70,kouchou.room_top_border_y+20,string_hash_to_newline(string(round(fps_real/200)*200)+" fps"))
	}
	else if fps_real>80
	{
		draw_set_color(c_white)    
		draw_text(kouchou.room_left_border_x+70,kouchou.room_top_border_y+20,string_hash_to_newline(string(round(fps_real/10)*10)+" fps"))
	}
	else
	{
		draw_set_color(c_red)
		draw_text(kouchou.room_left_border_x+70,kouchou.room_top_border_y,string_hash_to_newline(string(round(fps_real))+" fps"))
	}
}   




 