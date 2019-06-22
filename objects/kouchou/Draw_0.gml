
if room==menu
{
	//draw_set_alpha(1)
	draw_clear(menu_letterbox_colour)
	draw_sprite(menu_background_1,menu_background_subspr,midx,midy)
	draw_sprite_ext(log,menu_logo_subspr,room_width/2,225,4,4,0,c_white,1)
	draw_set_font(font_coins)
	draw_set_halign(fa_middle)
	draw_set_colour(c_gray)   
    
    
    
	////draw main menu options
    
	for (i=0; i<MENUSELECTMAX; i+=1)
	{
		draw_set_colour(c_black)
		if menuselect==i     ////draw selected menu item settings
		{
			draw_set_colour(c_white)  ///c_white
			var crabxoffset;
			crabxoffset=40+string_width(main_menu_texts[i])/2
			draw_sprite(crab_select_icon_gray,menu_crab_subspr,room_width/2-crabxoffset,room_height-375+50*i)
			draw_sprite(crab_select_icon_gray,menu_crab_subspr,room_width/2+crabxoffset,room_height-375+50*i)
		}
		if i==0                          ///// else draw non-selected menu item settings
			draw_set_colour(c_silver)
		draw_text(room_width/2,room_height-375+50*i,main_menu_texts[i])
		draw_set_colour(c_black)
	};
    

}
if room==loremenu
{

	//draw_set_alpha(1)
	var lorelistx,lorelisty,lorelistinterval;    
	lorelistx=97
	lorelisty=640
	lorelistinterval=40
    
	draw_set_colour(c_gray)    //lore list box    
	draw_rectangle(lorelistx,lorelisty,lorelistx+200,lorelisty+330,false) 
    
	draw_set_colour(c_black)   ///back button
	draw_set_font(font_coins)
	draw_set_valign(fa_left)
	if lorebackselect==true
	draw_set_colour(c_white)
	draw_text(lorelistx-90,lorelisty+290,"back")
    
    
	var loreboxx,loreboxy;
	loreboxx=310
	loreboxy=370
    
	for (i=0; i<LORELISTNUMBER; i+=1)
	{
		if lorescroll+i<ds_list_size(lore_list)
		{
			draw_set_font(font_coins)
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

if room==settings
{    
	//draw_set_alpha(1)
	draw_set_font(font_coins)
	draw_set_halign(fa_left)
	draw_set_valign(fa_left)
    

	draw_sprite(temp_settings_background_1,0,0,0)
    
	var xx,yy,vgap;
	xx=150    //settings title x
	yy=300
	vgap=55
	xx2=850   ///settings setting x,,
    
    
	var t;
	t=""
        
	draw_set_colour(c_black)
	if setmenu_select==0
		draw_set_colour(c_silver)
	draw_text(xx,yy,"display mode")
	if setmenu_fullscreen==true
		t="fullscreen"
	else
		t="windowed"
	draw_text(xx2,yy,t)
        
	draw_set_colour(c_black)
	if setmenu_select==1
		draw_set_colour(c_silver)
	draw_text(xx,yy+vgap,"graphics detail")
	if setmenu_graphics_fid==0
		t="low"
	else if setmenu_graphics_fid==1
		t="high"
    
	draw_text(xx2,yy+vgap,t)
        
	draw_set_colour(c_black)
	if setmenu_select==2
		draw_set_colour(c_silver)
	draw_text(xx,yy+vgap*2,"sound effects volume")
	draw_text(xx2,yy+vgap*2,setmenu_eff_volume)
    
	draw_set_colour(c_black)
	if setmenu_select==3
		draw_set_colour(c_silver)
	draw_text(xx,yy+vgap*3,"background music volume")
	draw_text(xx2,yy+vgap*3,setmenu_bgm_volume)

	draw_set_colour(c_black)
	if setmenu_select==4
		draw_set_colour(c_silver)
	draw_text(xx,yy+vgap*4,"show fps counter")

	if setmenu_show_fps==true
		t="True"
	else
		t="False"
	draw_text(xx2,yy+vgap*4,t)

    
	draw_set_colour(c_black)
	if setmenu_select==5
		draw_set_colour(c_silver)
	draw_text(xx,yy+vgap*5,"input code")
	if setmenu_codetxt==""
		t="-"
	else
		t=setmenu_codetxt
	draw_text(xx2,yy+vgap*5,t)
    
	draw_set_colour(make_colour_hsv(50,181,207))
	draw_text(room_width/3,room_height-200,"Press Esc to save changes and leave")
    

}



if room==multiplayermenu
{
	draw_set_halign(fa_left)
	draw_set_alpha(1)    
	draw_set_font(font_charselect)    
    
	//// if competitive, draw backgrounds and props
	if competitive_mode
	{
		draw_clear(c_navy)
		draw_sprite_ext(menu_competitive_groundback,0,0,room_height-650,room_width/100,1,0,c_white,1)
		draw_sprite(cupppp,0,room_width/2,room_height/2)
		draw_sprite(menu_first_to,0,room_width/2,60)
	}
    
    


	for (i=0; i<MAX_PLAYER_COUNT; i+=1)
	{    
		/// if not competitive, draw coloured player backgrounds (temp)
		if !competitive_mode
			draw_sprite(character_grid_selected_back,i,menu_player_options_x[i],menu_player_options_y[i]) 
        
        
		//player join slot prompts
		draw_set_colour(c_silver) 
		if ready[i]==-1 && i==next_open_slot
		{
			draw_sprite_ext(menu_join_game_prompt_box,0,menu_player_join_prompt_x[i],menu_player_join_prompt_y[i]+200,1,1,0,CHARACTER_SELECT_OPTIONS_COLOUR[i],1)
			var t;
				t="press [space]\n to add keyboard player \npress [start] on controller\n to join"
			if number_of_keyboards_in_use==1
				t="press [enter]\n to add keyboard player\npress [start] on controller\n to join"
			if number_of_keyboards_in_use>1
				t="press [start]\n on controller to join"
			draw_text(menu_player_join_prompt_x[i],menu_player_join_prompt_y[i]+50,t)
		}
        
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
			if ready[i]!=2
				draw_sprite_ext(character_portraits_array[selected_character_id[i]],character_portraits_subspr,charpor_x[i]+flipextra_x,charpor_y[i],flip,1,0,c_white,1)
			else
				draw_sprite_ext(character_portraits_array[selected_character_id[i]],0,charpor_x[i]+flipextra_x,charpor_y[i],flip,1,0,c_white,1)
				
			//draw options frame
			if ready[i]==0 || ready[i]==1
				draw_sprite_ext(menu_player_options_frame,0,menu_player_options_x[i],menu_player_options_y[i],1,1,0,CHARACTER_SELECT_OPTIONS_COLOUR[i],1)
		}
		if ready[i]==0     /// selecting character, draw character bio
		{
			for (ii = 0; ii < ds_list_size(lore_character_select_bio_array[selected_character_id[i]]); ++ii) 
			{
				draw_text(menu_player_options_x[i]+50,menu_player_options_y[i]+50+(ii*35),ds_list_find_value(lore_character_select_bio_array[selected_character_id[i]],ii)   )
			}
			
			//draw_text(menu_player_options_x[i]+50,menu_player_options_y[i]+70,lore_character_select_bio[selected_character_id[i]]) [continue] lore_character_select_bio_0
		}
		else if ready[i]==1                                                                   ////// player options setup 
		{
			var normalcol,hovercol;
			normalcol=c_silver
			hovercol=c_white
			draw_set_colour(normalcol)
            
			if readymenuselect[i]==0
				draw_set_colour(hovercol)
			draw_text(menu_player_options_x[i]+150,menu_player_options_y[i]+100,"control scheme -")
		
			var t;
			if control_setup[i]=="kb_full"
				t="keyboard full"
			else if control_setup[i]=="kb_left"
				t="keyboard narrow 1"
			else if control_setup[i]=="kb_right"
				t="keyboard narrow 2"
			else if control_setup[i]=="controller_default"
				t="controller default"
			else if control_setup[i]=="controller_custom"
				t="controller custom 1"

			draw_text(menu_player_options_x[i]+350,menu_player_options_y[i]+100,t)
            
            
			draw_set_colour(normalcol)
			if readymenuselect[i]==1
				draw_set_colour(hovercol)
			draw_text(menu_player_options_x[i]+150,menu_player_options_y[i]+130,"hp")
			if playerhandicap[i]==1
				draw_text(menu_player_options_x[i]+150,menu_player_options_y[i]+130,"+")
			else if playerhandicap[i]==2
				draw_text(menu_player_options_x[i]+150,menu_player_options_y[i]+130,"++")
                
			draw_set_colour(normalcol)
			if readymenuselect[i]==2
				draw_set_colour(hovercol)
            
			draw_text(menu_player_options_x[i]+150,menu_player_options_y[i]+150,"palette")
			draw_text(menu_player_options_x[i]+350,menu_player_options_y[i]+150,string(palette[i]))               
            
		}
	};
    
	if !competitive_mode
		draw_sprite(mock_character_grid_background,0,midx,midy)
        
	for (i=0; i<chargrid_numberofcolumns; i+=1)
	{   
		for (ii=0; ii<chargrid_numberofrows; ii+=1)
		{
			draw_sprite(character_smallportraits,convert_chargrid_columnrow_to_char(i,ii),chargrid_x[i],chargrid_y[ii])
		}
	}
    
	/*draw_set_colour(c_white)
	draw_set_font(font_buglist)
	draw_set_halign(fa_center)
	draw_text(room_width/2,room_height*(4/5),buglist_text)  */ 
    

	draw_set_font(font_coins)
	draw_set_valign(fa_middle)
	draw_set_colour(c_black)
    
	/*var p1x,p1y,p2x,p2y;   [finaledit] remember to draw handicap in the select menu
    
	draw_text(p1x,p1y,"Player 1")
	if playerhandicap[0]>0
	draw_sprite(handicapicon,image_index,p1x+200,p1y)
	if playerhandicap[0]>1
	draw_sprite(handicapicon,image_index,p1x+230,p1y)
        
	draw_text(p2x,p2y,"Player 2")    
	if playerhandicap[1]>0
	draw_sprite(handicapicon,image_index,p2x+200,p2y)
	if playerhandicap[1]>1
	draw_sprite(handicapicon,image_index,p2x+230,p2y)*/

	for (i=0; i<4; i+=1)
	{
		if ready[i]==0
			draw_sprite(selectbox_sprites[i],char_selectbox_subspr+i,chargrid_x[convert_chargrid_char_to_column(selected_character_id[i])],chargrid_y[convert_chargrid_char_to_row(selected_character_id[i])])
	};
    
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
		draw_text(room_width/2,room_height/2,t)
	}
    

}


if starbucksmode
{
	if !mouse_check_button(mb_left)
	{
		draw_set_colour(c_black)
		draw_rectangle(0,0,mouse_x-25,room_height,false)
		draw_rectangle(mouse_x+25,0,room_width,room_height,false)
	}
}


/* */
/*  */
