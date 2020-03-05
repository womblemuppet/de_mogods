if menu_any_player_backward_button_check()
{
	if room==menu
	{
	    if main_menu_select=="exit"
	        game_end()
	    else
	    {
		    	with ds_map_find_value(main_menu_option_components,main_menu_select)
				main_menu_option_components_get_unselected()
			main_menu_select_number=MAIN_MENU_SELECT_NUMBER_MAX
			main_menu_select=main_menu_select_options[main_menu_select_number]
			with ds_map_find_value(main_menu_option_components,main_menu_select)
				main_menu_option_components_get_selected()
	    }
	}
	else if room==multiplayermenu
	{
	    room=menu
	}
	else if room==settings
	{
	    var OPT;
	    OPT=file_text_open_write("options.txt")
	    if OPT==-1
	        show_error("options file can not be created",true)
	    file_text_write_string(OPT,"fullscreen=")    
	    file_text_write_string(OPT,setmenu_fullscreen)
	    file_text_writeln(OPT)
	    file_text_write_string(OPT,"scale_screen=")    
	    file_text_write_string(OPT,setmenu_scale_screen)
	    file_text_writeln(OPT)
	    file_text_write_string(OPT,"eff_volume=")
	    file_text_write_string(OPT,setmenu_eff_volume)
	    file_text_writeln(OPT)
	    file_text_write_string(OPT,"bgm_volume=")
	    file_text_write_string(OPT,setmenu_bgm_volume)
	    file_text_writeln(OPT)
	    file_text_write_string(OPT,"show_fps=")   
	    if setmenu_show_fps==false
	        file_text_write_string(OPT,"0")
	    else
	        file_text_write_string(OPT,"1")    
	   
	    file_text_write_string(OPT,setmenu_eff_volume)
	    file_text_writeln(OPT)
	    file_text_write_string(OPT,"block_width=")
	    file_text_write_string(OPT,setmenu_block_width)
	    file_text_writeln(OPT)
	    file_text_write_string(OPT,"block_height=")   
	    file_text_write_string(OPT,setmenu_block_height)

	    file_text_close(OPT)   
	    show_debug_message("options saved")
    
	    window_set_fullscreen(setmenu_fullscreen)
	    room=menu
    
	}
	else if room==loremenu
	{
	    if lorebackselect==true
	        room=menu
	    else
	        lorebackselect=true
	}
}



if room==multiplayermenu
{
	/////start game countdown
	if game_start_countdown>0
	{
		game_start_countdown-=1
		if game_start_countdown==0
		{
			//go to initialisation room (spawning Aizen and finalising key bindings for each player in)
			room=init
		}
	}
	
	
	///////////  choose number of rounds  //////////////////////////////////////////
	if selecting_number_of_games==true
	{
		///create smoke effects
		if rch_smoke_timer>0
			rch_smoke_timer--
		else
		{
			number_of_rounds_create_smoke()
			rch_smoke_timer=RCH_SMOKE_TIMER_MAX
		}
		
		
		if menu_any_player_up_button_check()
		{
			number_of_games_index++
			if number_of_games_index==AMOUNT_OF_POSSIBLE_NUMBER_OF_GAMES
				number_of_games_index=0
				
			number_of_games=possible_number_of_games_array[number_of_games_index]
			number_of_games_cup_id.sprite_index=NUMBER_OF_GAMES_CUP_SPRITES[number_of_games_index]
		}
		else if menu_any_player_down_button_check()
		{
			number_of_games_index--
			if number_of_games_index==-1
				number_of_games_index=AMOUNT_OF_POSSIBLE_NUMBER_OF_GAMES-1
				
			number_of_games=possible_number_of_games_array[number_of_games_index]
			number_of_games_cup_id.sprite_index=NUMBER_OF_GAMES_CUP_SPRITES[number_of_games_index]
		}
		else if menu_any_player_forward_button_check()
		{    ///go to character select
			selecting_number_of_games=false
			
			//disperse smoke
			with menu_component_generic
			{
				if step_script==number_of_rounds_smoke_step_event
				{
					mode="dying"
					sprite_index=rch_smoke1_die
					image_index=0
					image_speed=0.02
				}
			}
			
			//destroy old components
			with number_of_games_background
				instance_destroy()
			with number_of_games_cup_glow_id
				instance_destroy()
			with number_of_games_cup_id
				instance_destroy()
				
			//create character select components
			
			create_menupart_generic(character_select_background_spr,0,0,0,5,undefined)

			for (var i = 0; i < number_of_characters;i++)
				create_small_portrait(small_portrait_x[i],small_portrait_y[i],character_smallportraits_array[i])

			var char_number,a,xx,yy;
			char_number=0

			for (var i = 0; i < small_portraits_number_of_columns; i++)
			{
				for (ii=0; ii<small_portraits_number_of_rows; ii+=1)
				{
					xx=small_portrait_x[convert_chargrid_char_to_column(char_number)]
					yy=small_portrait_y[convert_chargrid_char_to_row(char_number)]
					a=create_menupart_generic(character_smallportraits_array[char_number],0,xx,yy,-60,undefined)

					char_number++
				}
			}

			for (var playerId = 0; playerId < 2;playerId++)  ///for number of players [finaledit]
			{
				///create slab
				create_menupart_generic(CHARACTER_SELECT_SLAB_SPRITES[playerId],0,menu_player_slab_x[playerId],menu_player_slab_y[playerId],-70,undefined)
			}
			
			//create keyboard icons
			component_keyboard_icon_p1=create_menupart_generic(keyboard_icon1,0.2,menu_controller_x,menu_controller_y,-150,undefined)
			component_keyboard_icon_p2=create_menupart_generic(keyboard_icon2,0.2,menu_controller_x,menu_controller_y+25,-150,undefined)
			
		}
		exit
	}
	
	
	///////////  add new keyboard players   ////////////////////////////////////////////
	var keyboard_added_this_step;
	keyboard_added_this_step=false
    
	if number_of_keyboards_in_use==0
	{  
		if  (keyboard_check_pressed(kb1_forward_button) || keyboard_check_pressed(kb2_forward_button) )   //////// keyboard start button (first kb player)
		{
			set_next_open_slot()
			create_player_entered_components(next_open_slot)
			
			with component_keyboard_icon_p1
			{
				var a;
				a=effect_aniend(sprite_index,2,-50)
				a.hspeed=-3				
				instance_destroy()
			}
				
			if game_start_countdown<1
			{
				if players_in<MAX_PLAYER_COUNT  /// keyboard entry player 1
				{
					keyboard_added_this_step=true
					ready[next_open_slot]=0
					control_setup[next_open_slot]="kb_left"
					player_join_update_controller_variables()
				}
			}
		}
	}
	
	if number_of_keyboards_in_use==1
	{  
		if keyboard_check_pressed(kb2_forward_button) && keyboard_added_this_step==false
		{
			if players_in<MAX_PLAYER_COUNT                                             /// keyboard entry player 2
			{
				keyboard_added_this_step=true
				set_next_open_slot()
				ready[next_open_slot]=0
				control_setup[next_open_slot]="kb_right"
				create_player_entered_components(next_open_slot)
				
			
				with component_keyboard_icon_p2
				{
					var a;
					a=effect_aniend(sprite_index,2,-50)
					a.hspeed=3				
					instance_destroy()
				}
				
				//change full keyboard setup to 1/2 version
				///safer to just search for it than to save variable that could be changed?[finaledit]
				///currently obsolete, full keyboard setup is not in use
				for (var i=0; i<MAX_PLAYER_COUNT; i+=1)
				{
					if control_setup[i]=="kb_full"
					{
						control_setup[i]="kb_left"
					}
				};
				
				player_join_update_controller_variables()
			}
		}
	}
	
	
	var controller_added_this_step;
	controller_added_this_step=false
    
	
	
	//////Add controller when start button pressed/////
	for (var i=0; i<12; i+=1)
	{
		if controller_player_slot[i]==-1 && gamepad_is_connected(i) && gamepad_button_check_pressed(i,gp_start)
		{
			controller_added_this_step=true
			controller_player_slot[i]=next_open_slot
			ready[next_open_slot]=0
			create_player_entered_components(next_open_slot)
			
			var a;
			a=effect_aniend(controllericon1,2,-50)
			a.x=kouchou.menu_controller_x
			a.y=kouchou.menu_controller_y
			a.hspeed=3				

			
			
			control_setup[next_open_slot]="controller_default"
			player_join_update_controller_variables()

		}
	}
           
	//////select screen keyboard
	if number_of_keyboards_in_use>0 && !keyboard_added_this_step
	{
		if keyboard_check_pressed(kb1_left_button)
			character_select_button_left(kb1_player_slot)
		else if keyboard_check_pressed(kb1_right_button)
			character_select_button_right(kb1_player_slot)
		else if keyboard_check_pressed(kb1_up_button)
			character_select_button_up(kb1_player_slot)
		else if keyboard_check_pressed(kb1_down_button)
			character_select_button_down(kb1_player_slot)
		else if keyboard_check_pressed(kb1_forward_button)
			character_select_button_start(kb1_player_slot)		
	}
	if number_of_keyboards_in_use>1  && !keyboard_added_this_step
	{
		if keyboard_check_pressed(kb2_left_button)
			character_select_button_left(kb2_player_slot)
		else if keyboard_check_pressed(kb2_right_button)
			character_select_button_right(kb2_player_slot)
		else if keyboard_check_pressed(kb2_up_button)
			character_select_button_up(kb2_player_slot)
		else if keyboard_check_pressed(kb2_down_button)
			character_select_button_down(kb2_player_slot)
		else if keyboard_check_pressed(kb2_forward_button)
			character_select_button_start(kb2_player_slot)		
	}
	
	//////select screen controllers	
	
	if !controller_added_this_step
	{
		for (var i=0; i<12; i+=1)
		{
			if controller_player_slot[i]>-1 && gamepad_is_connected(i) 
			{
				if gamepad_button_check_pressed(i,gp_padl)
					character_select_button_left(controller_player_slot[i])
				else if gamepad_button_check_pressed(i,gp_padr)
					character_select_button_right(controller_player_slot[i])
				else if gamepad_button_check_pressed(i,gp_padu)
					character_select_button_up(controller_player_slot[i])
				else if gamepad_button_check_pressed(i,gp_padd)
					character_select_button_down(controller_player_slot[i])
				else if gamepad_button_check_pressed(i,gp_start)
					character_select_button_start(controller_player_slot[i])		
			}
		}
	}
	
}
else if room==menu
{ 	
	menu_crab_subspr+=0.2
	if menu_crab_subspr>MENU_CRAB_SUBSPR_LIMIT
		menu_crab_subspr=0


	if menu_any_player_forward_button_check()
	{
		switch main_menu_select
		{
			case "singleplayer":
			room=preoverworld			break;
			case "competitive_mode":
			competitive_mode=true   
			map="multiplayer"
			MAX_PLAYER_COUNT=2
			
			kouchou_set_select_menu_positions()
			
			room=multiplayermenu		break;
			
			case "party_mode":
			competitive_mode=false
			map="multiplayer"
			MAX_PLAYER_COUNT=4
                
			kouchou_set_select_menu_positions()
                
			room=multiplayermenu		break;
			case "lore":
				room=loremenu			break;
			case "settings":
				room=settings			break;
			case "exit":
				game_end()			break;
			default:
				show_error("unknown main_menu_select destination",true) 
									break;
		}
	}
}
else if room==loremenu
{
	if menu_any_player_backward_button_check()
	{
		if lorebackselect==true
			room=menu
	}
}
else if room==settings 
{
	if keyboard_check(kb1_forward_button)
	{
		if setmenu_codetxt=="drinkmode"
			drinkmode=true
			
		
		keyboard_string=""   
		effect_create_above(ef_firework,room_width/2,room_height/2,2,c_blue) 
	}
	else if keyboard_check(vk_anykey)
	{
		if setmenu_select==4  //use and display keyboard string if over 'enter code' setting
			setmenu_codetxt=keyboard_string
		else
		{
			//reset keyboard string
			setmenu_codetxt=""
			keyboard_string=""
		}
	}
}
else if room==gameroom
{
	/////////ANALOGUE STICKS TRACKER
	/// sets stick_pressed values for each player to simulate pressed (1), held (2) and released (3) analogue events.

	for(i =0 ; i < players_in;i++) //[finaledit] may cause problem using players_in
	{
		if ds_map_find_value(kouchou.keybinding_map_array[i],"gamepad")
		{
			var padnumber,h_axis,v_axis;
			padnumber=ds_map_find_value(kouchou.keybinding_map_array[i],"padnumber")
			h_axis=gamepad_axis_value(padnumber,gp_axislh)
			v_axis=gamepad_axis_value(padnumber,gp_axislv)

			if stick_pressed_r[i]==3
				stick_pressed_r[i]=0
			if stick_pressed_u[i]==3
				stick_pressed_u[i]=0
			if stick_pressed_l[i]==3
				stick_pressed_l[i]=0
			if stick_pressed_d[i]==3
				stick_pressed_d[i]=0

			if h_axis>deadzone[i]
			{
				if stick_pressed_l[i]==1 || stick_pressed_l[i]==2
					stick_pressed_l[i]=3
				if stick_pressed_r[i]==0
					stick_pressed_r[i]=1
				else
					stick_pressed_r[i]=2
			}
			else if h_axis<-deadzone[i]
			{
				if stick_pressed_r[i]==1 || stick_pressed_r[i]==2
					stick_pressed_r[i]=3
				if stick_pressed_l[i]==0
					stick_pressed_l[i]=1
				else
					stick_pressed_l[i]=2
			}
			
			if h_axis<=deadzone[i] && h_axis>=-deadzone[i]
			{
				if stick_pressed_l[i]==1 || stick_pressed_l[i]==2
					stick_pressed_l[i]=3
				if stick_pressed_r[i]==1 || stick_pressed_r[i]==2
					stick_pressed_r[i]=3

			}			
			
		
			if v_axis>deadzone[i]
			{
				if stick_pressed_u[i]==1 || stick_pressed_u[i]==2
					stick_pressed_u[i]=3
				if stick_pressed_d[i]==0
					stick_pressed_d[i]=1
				else
					stick_pressed_d[i]=2
			}		
			else if v_axis<-deadzone[i]
			{
				if stick_pressed_d[i]==1 || stick_pressed_d[i]==2
					stick_pressed_d[i]=3
				if stick_pressed_u[i]==0
					stick_pressed_u[i]=1
				else
					stick_pressed_u[i]=2
			}
			
			if v_axis<=deadzone[i] && v_axis>=-deadzone[i]
			{
				if stick_pressed_u[i]==1 || stick_pressed_u[i]==2
					stick_pressed_u[i]=3
				if stick_pressed_d[i]==1 || stick_pressed_d[i]==2
					stick_pressed_d[i]=3
			}
		}
	}
}
