if room==multiplayermenu
{
	/////sprites
	character_portraits_subspr+=0.15
	if character_portraits_subspr>CHARACTER_PORTRAITS_SUBSPR_LIMIT
		character_portraits_subspr=0

	char_selectbox_subspr+=0.1
	if char_selectbox_subspr>CHAR_SELECTBOX_SUBSPR_LIMIT
		char_selectbox_subspr=0



	/////start game countdown
	if game_start_countdown>0
	{
		game_start_countdown-=1
		if game_start_countdown==0
		{
			room=init
		}
	}
	

	var keyboard_added_this_step;
	keyboard_added_this_step=false
    
	if number_of_keyboards_in_use==0
	{  
		if  (keyboard_check_pressed(kb1_start_button) || keyboard_check_pressed(kb2_start_button) )   //////// keyboard start button (first kb player)
		{
			set_next_open_slot()
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
	//else
	//{    
	//	if keyboard_check_pressed(kb1_start_button)                                         ///start button P1 (options/lockin)
	//	{
	//		character_select_button_start(kb1_player_slot)
	//	}
	//}         
	
	if number_of_keyboards_in_use==1
	{  
		if keyboard_check_pressed(kb2_start_button)  && keyboard_added_this_step==false
		{
			if players_in<MAX_PLAYER_COUNT                                                                                           /// keyboard entry player 2
			{
				keyboard_added_this_step=true
				set_next_open_slot()
				ready[next_open_slot]=0
				control_setup[next_open_slot]="kb_right"
                
				//change full keyboard setup to 1/2 version
				///safer to just search for it than to save variable that could be changed?[finaledit]
				for (i=0; i<MAX_PLAYER_COUNT; i+=1)
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
	//else if number_of_keyboards_in_use>1
	//{
	//	if keyboard_check_pressed(kb2_start_button)                                                                           ///start button P2 (options/lockin)
	//	{
	//		character_select_button_start(kb2_player_slot)
	//	}    
	//}
    

	
	
	var controller_added_this_step;
	controller_added_this_step=false
    
	
	
	//////Add controller when start button pressed/////
	for (i=0; i<12; i+=1)
	{
		if controller_player_slot[i]==-1 && gamepad_is_connected(i) && gamepad_button_check_pressed(i,gp_start)
		{
			controller_added_this_step=true
			controller_player_slot[i]=next_open_slot
			ready[next_open_slot]=0
			control_setup[next_open_slot]="controller_default"
			player_join_update_controller_variables()
		}
	}
	
	
	
	//if controller_added_this_step==false
	//{      
	//	for (iii=0; iii<12; iii+=1)
	//	{
	//		if controller_player_slot[iii]>-1
	//		{
	//			if gamepad_button_check_pressed(iii,gp_start)                                                                           ///start button controllers (options/lockin)
	//			{
	//				character_select_button_start(  controller_player_slot[iii]  )
	//			}
	//		}
	//	}
	//}
    

        
        
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
		for (i=0; i<12; i+=1)
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
	menu_background_subspr+=0.05
	if menu_background_subspr>floor(MENU_BACKGROUND_SUBSPR_LIMIT)
		menu_background_subspr=0

	menu_logo_subspr+=0.05
	if menu_logo_subspr>MENU_LOGO_SUBSPR_LIMIT
		menu_logo_subspr=0        
	
	menu_crab_subspr+=0.2
	if menu_crab_subspr>MENU_CRAB_SUBSPR_LIMIT
		menu_crab_subspr=0


	if menu_any_player_start_button_check()
	{
		switch menuselect
		{
			case 0:
			room=preoverworld           break;
			case 1:
			competitive_mode=true   
			map="multiplayer"
			MAX_PLAYER_COUNT=2
                
			kouchou_set_charpor()

                
			room=multiplayermenu    break;
			case 2:
			competitive_mode=false
			map="multiplayer"
			MAX_PLAYER_COUNT=4
                
			kouchou_set_charpor()
                
			room=multiplayermenu    break;
			case 3:
				room=loremenu           break;
			case 4:
				room=settings           break;
			case 5:
				game_end()              break;
			default:
				show_error("unknown menuselect destination",true) break;
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
		if setmenu_select==5
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
	for(i =0 ; i < players_in-1;i++) //[finaledit] may cause problem using players_in
	{
		if ds_map_find_value(kouchou.keybinding_map_array[i],"gamepad")
		{
			var padnumber;
			padnumber=ds_map_find_value(kouchou.keybinding_map_array[i],"padnumber")
			h_axis=gamepad_axis_value(padnumber,gp_axislh)
			v_axis=gamepad_axis_value(padnumber,gp_axislv)
			show_debug_message("i = "+string(i)+ "  padnumber = "+string(padnumber))
		
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
				if stick_pressed_r[i]==1
					stick_pressed_r[i]=2
				else
					stick_pressed_r[i]=1
			}
			else if h_axis<-deadzone[i]
			{
				if stick_pressed_r[i]==1 || stick_pressed_r[i]==2
					stick_pressed_r[i]=3
				if stick_pressed_l[i]==1
					stick_pressed_l[i]=2
				else
					stick_pressed_l[i]=1
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
				if stick_pressed_d[i]==1
					stick_pressed_d[i]=2
				else
					stick_pressed_d[i]=1
			}		
			else if v_axis<-deadzone[i]
			{
				if stick_pressed_d[i]==1 || stick_pressed_d[i]==2
					stick_pressed_d[i]=3
				if stick_pressed_u[i]==1
					stick_pressed_u[i]=2
				else
					stick_pressed_u[i]=1
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
