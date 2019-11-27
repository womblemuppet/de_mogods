if room==multiplayermenu
{
	/////start game countdown
	if game_start_countdown>0
	{
		game_start_countdown-=1
		if game_start_countdown==0
		{
			room=init
		}
	}
	
	
	///////////  choose number of rounds  //////////////////////////////////////////
	if selecting_number_of_games==true
	{
		
		if rch_smoke_timer>0
			rch_smoke_timer--
		else  ///create smoke
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
		else if menu_any_player_start_button_check()
		{  ///go to character select
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
				
			//create new components
			create_menupart_generic(character_select_background_spr,0,0,0,5,undefined)
			
			
			for (var i = 0; i < number_of_characters;i++)
			{
				create_small_portrait(smallportrait_x[i],smallportrait_y[i],character_smallportraits_array[i])
			}
			
			
			var char_number,a,xx,yy;
			char_number=0
			
			for (var i = 0; i < small_portraits_number_of_columns; i++)
			{
				for (ii=0; ii<small_portraits_number_of_rows; ii+=1)
				{
					xx=smallportrait_x[convert_chargrid_char_to_column(char_number)]
					yy=smallportrait_y[convert_chargrid_char_to_row(char_number)]
					a=create_menupart_generic(character_smallportraits_array[char_number],0,xx,yy,-60,undefined)
					
					char_number++
				}
			}
			
			for (var i = 0; i < 2;i++)  ///for number of players [finaledit]
			{
				///create slab
				create_menupart_generic(CHARACTER_SELECT_SLAB_SPRITES[i],0,menu_player_slab_x[i],menu_player_slab_y[i],-70,undefined)
			}
			
			
			
		}
		exit
	}
	
	
	///////////  add new keyboard players   ////////////////////////////////////////////
	var keyboard_added_this_step;
	keyboard_added_this_step=false
    
	if number_of_keyboards_in_use==0
	{  
		if  (keyboard_check_pressed(kb1_start_button) || keyboard_check_pressed(kb2_start_button) )   //////// keyboard start button (first kb player)
		{
			set_next_open_slot()
			create_player_entered_components(next_open_slot)
			if game_start_countdown<1
			{
				if players_in<MAX_PLAYER_COUNT  /// keyboard entry player 1
				{
					keyboard_added_this_step=true
					ready[next_open_slot]=0
					control_setup[next_open_slot]="kb_full"
					player_join_update_controller_variables()
				}
			}
		}
	}
	
	if number_of_keyboards_in_use==1
	{  
		if keyboard_check_pressed(kb2_start_button) && keyboard_added_this_step==false
		{
			if players_in<MAX_PLAYER_COUNT                                                                                           /// keyboard entry player 2
			{
				keyboard_added_this_step=true
				set_next_open_slot()
				ready[next_open_slot]=0
				control_setup[next_open_slot]="kb_right"
				create_player_entered_components(next_open_slot)
				
				//change full keyboard setup to 1/2 version
				///safer to just search for it than to save variable that could be changed?[finaledit]
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
			control_setup[next_open_slot]="controller_default"
			player_join_update_controller_variables()

		}
	}
           
	//////select screen keyboard
	if number_of_keyboards_in_use>0 && !keyboard_added_this_step
	{
		if keyboard_check_pressed(kb1_left_button)
		{
			character_select_button_left(kb1_player_slot)
		}
		if keyboard_check_pressed(kb1_right_button)
		{
			character_select_button_right(kb1_player_slot)
		}
		if keyboard_check_pressed(kb1_up_button)
		{
			character_select_button_up(kb1_player_slot)
		}
		if keyboard_check_pressed(kb1_down_button)
		{
			character_select_button_down(kb1_player_slot)
		}
		if keyboard_check_pressed(kb1_start_button)
		{
			character_select_button_start(kb1_player_slot)		
		}
	}
	if number_of_keyboards_in_use>1  && !keyboard_added_this_step
	{
		if keyboard_check_pressed(kb2_left_button)
		{
			character_select_button_left(kb2_player_slot)
		}
		if keyboard_check_pressed(kb2_right_button)
		{
			character_select_button_right(kb2_player_slot)
		}
		if keyboard_check_pressed(kb2_up_button)
		{
			character_select_button_up(kb2_player_slot)
		}
		if keyboard_check_pressed(kb2_down_button)
		{
			character_select_button_down(kb2_player_slot)
		}
		if keyboard_check_pressed(kb2_start_button)
		{
			character_select_button_start(kb2_player_slot)		
		}
	}
	
	//////select screen controllers	
	
	if !controller_added_this_step
	{
		for (var i=0; i<12; i+=1)
		{
			if controller_player_slot[i]>-1 && gamepad_is_connected(i) 
			{
				if gamepad_button_check_pressed(i,gp_padl)
				{
					character_select_button_left(controller_player_slot[i])
				}
				if gamepad_button_check_pressed(i,gp_padr)
				{
					character_select_button_right(controller_player_slot[i])
				}
				if gamepad_button_check_pressed(i,gp_padu)
				{
					character_select_button_up(controller_player_slot[i])
				}
				if gamepad_button_check_pressed(i,gp_padd)
				{
					character_select_button_down(controller_player_slot[i])
				}
				if gamepad_button_check_pressed(i,gp_start)
				{
					character_select_button_start(controller_player_slot[i])		
				}
			}
		}
	}
	
}
else if room==menu
{ 	
	menu_crab_subspr+=0.2
	if menu_crab_subspr>MENU_CRAB_SUBSPR_LIMIT
		menu_crab_subspr=0


	if menu_any_player_start_button_check()
	{
		switch main_menu_select
		{
			case "singleplayer":
			room=preoverworld           break;
			case "competitive_mode":
			competitive_mode=true   
			map="multiplayer"
			MAX_PLAYER_COUNT=2
			
			kouchou_set_select_menu_positions()

                
			room=multiplayermenu    break;
			case "party_mode":
			competitive_mode=false
			map="multiplayer"
			MAX_PLAYER_COUNT=4
                
			kouchou_set_select_menu_positions()
                
			room=multiplayermenu    break;
			case "lore":
				room=loremenu           break;
			case "settings":
				room=settings           break;
			case "exit":
				game_end()              break;
			default:
				show_error("unknown main_menu_select destination",true) break;
		}
	}
}
else if room==loremenu
{
	if menu_any_player_start_button_check()
	{
		if lorebackselect==true
		{
			room=menu
		}
	}
}
else if room==settings 
{
	if keyboard_check(kb1_start_button)
	{
		if setmenu_codetxt=="drinkmode"
			drinkmode=true
		keyboard_string=""   
		effect_create_above(ef_firework,room_width/2,room_height/2,2,c_blue) 
	}
	else if keyboard_check(vk_anykey)
	{
		if setmenu_select==4
		{
			setmenu_codetxt=keyboard_string        
		}
		else
		{
			setmenu_codetxt=""
			keyboard_string=""
		}
	}
}
else if room==gameroom
{
	/////////ANALOGUE STICK EVENT TRACKER
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
