if room==loremenu
{
	var lorelistx,lorelisty,lorelistinterval;    
	lorelistx=97
	lorelisty=640
	lorelistinterval=40
    
	draw_set_colour(c_gray)    //lore list box    
	draw_rectangle(lorelistx,lorelisty,lorelistx+200,lorelisty+330,false) 
    
	draw_set_colour(c_black)   ///back button
	draw_set_font(font_menu)
	draw_set_valign(fa_left)
	if lorebackselect==true
	draw_set_colour(c_white)
	draw_text(lorelistx-90,lorelisty+290,"back")
    
    
	var loreboxx,loreboxy;
	loreboxx=310
	loreboxy=370
    
	for (var i=0; i<LORELISTNUMBER; i+=1)
	{
		if lorescroll+i<ds_list_size(lore_list)
		{
			draw_set_font(font_menu)
			draw_set_colour(c_black)
			if loreselect==lorescroll+i && lorebackselect==false
				draw_set_colour(c_white)
			draw_text(10+lorelistx,5+lorelisty+lorelistinterval*i,ds_list_find_value(lore_list,lorescroll+i))
		}
	}; 
	draw_set_colour(c_white)
	draw_rectangle(loreboxx,loreboxy,loreboxx+825,loreboxy+600,false)     
	draw_set_colour(c_black)
	draw_text(loreboxx+20,loreboxy+20,ds_list_find_value(lore_data,loreselect))

}
else if room==settings
{    
	draw_set_font(font_menu)
	draw_set_halign(fa_left)
	draw_set_valign(fa_left)
    

	draw_sprite(temp_settings_background_1,0,0,0)
    
	var xx,yy,vgap;
	xx=150    //settings title x
	yy=300
	vgap=55
	xx2=850   ///settings setting x
    
    
	var t;
	t=""

	for (var i = 0; i < SETMENU_SELECT_NUMBER_MAX; i++) 
	{
		draw_set_colour(c_black)
		if setmenu_select==setmenu_select_options[i]
			draw_set_colour(c_silver)
			
		switch setmenu_select_options[i]
		{
			case "fullscreen":
				draw_text(xx,yy+vgap*i,"display mode")
				if setmenu_fullscreen==true
					t="fullscreen"
				else
					t="windowed"
				draw_text(xx2,yy+vgap*i,t)			
			break;
			
			case "scale_screen":
				if setmenu_fullscreen==false
					draw_set_color(c_dkgray)
				draw_text(xx,yy+vgap*i,"window scaling (changes on restart)")
				if setmenu_scale_screen==true
					t="on"
				else
					t="off"
				draw_text(xx2,yy+vgap*i,t)			
			break;
			
			
			case "sound_effects_volume":
				draw_text(xx,yy+vgap*i,"sound effects volume")
				draw_text(xx2,yy+vgap*i,setmenu_eff_volume)			
			break;
			
			case "background_music_volume":
				draw_text(xx,yy+vgap*i,"background music volume")
				draw_text(xx2,yy+vgap*i,setmenu_bgm_volume)
			break;
			
			case "fps_counter":
				draw_text(xx,yy+vgap*i,"show fps counter")
				if setmenu_show_fps==true
					t="On"
				else
					t="Off"
				draw_text(xx2,yy+vgap*i,t)
			break;
			
			case "code":
				draw_text(xx,yy+vgap*i,"input code")
				if setmenu_codetxt==""
					t="-"
				else
					t=setmenu_codetxt
				draw_text(xx2,yy+vgap*i,t)			
			break;
			
		}
	}

	draw_set_colour(make_colour_hsv(50,181,207))
	draw_text(room_width/3,room_height-100,"Press Esc to save changes and leave")
    

}
else if room==multiplayermenu && !selecting_number_of_games
{		
	draw_set_halign(fa_left)
	draw_set_alpha(1)
	draw_set_font(font_charselect)    
    
	//// if competitive, draw backgrounds and props
	if competitive_mode
	{
		draw_sprite(menu_first_to,0,room_width/2,60)
	}




	for (var i=0; i<MAX_PLAYER_COUNT; i+=1)
	{    
		/// if not competitive, draw coloured player backgrounds (temp)//[finaledit]

		draw_set_halign(fa_left)

		var flip,flipextra_x;     ///flips character select portrait for p1 and p3
		flip=-1
		flipextra_x=600
		if i mod 2 == 1
		{
			flip=1
			flipextra_x=0   
		}
            
		if ready[i]!=-1
		{
			//draw character portrait
		}

	}
    
	if !competitive_mode
		draw_sprite(mock_character_grid_background,0,midx,midy)


	//draw_set_font(font_menu)
	//draw_set_valign(fa_middle)
	//draw_set_colour(c_black)

	//for (var i=0; i<4; i+=1)
	//{
	//	if ready[i]==0
	//		draw_sprite(selectbox_sprites[i],0,small_portrait_x[convert_chargrid_char_to_column(selected_character_id[i])],small_portrait_y[convert_chargrid_char_to_row(selected_character_id[i])])
	//};
    
	///draw game start countdown
	if game_start_countdown>0
	{
		draw_set_colour(c_white)
		draw_set_halign(fa_center)
		draw_set_valign(fa_center)
		draw_set_font(font_startinggame)
		var t;
		if game_start_countdown>57
			t="3"
		else if game_start_countdown>39
			 t="2"
		else if game_start_countdown>21
			t="1"
		else
			t="start"
		draw_text(room_width/2,room_height/2+150,t)
	}
    

}


if starbucksmode
{
	depth=-10000
	if !mouse_check_button(mb_left)
	{
		draw_set_colour(c_black)
		draw_rectangle(0,0,mouse_x-25,room_height,false)
		draw_rectangle(mouse_x+25,0,room_width,room_height,false)
	}
}


/* */
/*  */
