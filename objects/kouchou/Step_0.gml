if room==menu
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

}
if keyboard_check_pressed(vk_space)
{
	if room==menu
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
	if room==loremenu
	{
		if lorebackselect==true
		{
			 room=menu
		}
	}
}


if room==multiplayermenu
{

    var keyboardaddedthisstep;
    keyboardaddedthisstep=false
    
    if numberofkeyboardsinuse==0
    {  
        if  (keyboard_check_pressed(keyboard1_start_button) || keyboard_check_pressed(keyboard2_start_button) )   //////// keyboard start button (first kb player)
        {
            find_first_slot()
            if startinggame<1
            {            
                if room==multiplayermenu 
                {
                    if numberofkeyboardsinuse==0
                    {
                        if playersin<MAX_PLAYER_COUNT  /// keyboard entry player 1
                        {
                            keyboardaddedthisstep=true
                            ready[nextopenslot]=0
                            control_setup[nextopenslot]=0
                            player_join_update_controller_variables()
                        }
                    }
                }                
            }
        }
    }
    else if numberofkeyboardsinuse>0
    {    
        if keyboard_check_pressed(keyboard1_start_button)                                         ///start button P1 (options/lockin)
        {
            if ready[keyboardoneslot]==0       
            {                       
                    ready[keyboardoneslot]+=1        
            }            
            else if ready[keyboardoneslot]==1                                                                                        /// lock in P1
            {
                ready[keyboardoneslot]=2
                if player_check_all_ready()
                {
                    effect_create_above(ef_firework,room_width/2,room_height/2,2,c_white)
                    startinggame=75
                }
            }
        }
    }         
    if numberofkeyboardsinuse==1 && keyboardaddedthisstep==false
    {  
        if keyboard_check_pressed(keyboard2_start_button)
        {
            if playersin<MAX_PLAYER_COUNT                                                                                           /// keyboard entry player 2
            {
                keyboardaddedthisstep=true
                find_first_slot()
                ready[nextopenslot]=0
                control_setup[nextopenslot]=2
                
                //change full keyboard setup to 1/2 version
                ///safer to just search for it than to save variable that could be changed? bad coding
                for (i=0; i<MAX_PLAYER_COUNT; i+=1)
                {
                    if control_setup[i]==0
                    {
                        control_setup[i]=1
                    }
                };  
                player_join_update_controller_variables()
                exit
            }
        }
    }
    else if numberofkeyboardsinuse>1
    {
        if keyboard_check_pressed(keyboard2_start_button)                                                                           ///start button P2 (options/lockin)
        {
            find_first_slot()
            if ready[keyboardtwoslot]==0       
            {                       
                    ready[keyboardtwoslot]+=1        
            }            
            else if ready[keyboardtwoslot]==1                                                                                             /// lock in P2
            {
                ready[keyboardtwoslot]=2
                if player_check_all_ready()
                {
                    multiplayer_game_start_countdown()
                }
            }
        }    
    }
    



    if startinggame>0
    {
        startinggame-=1
        if startinggame==0
        {
            room=init            
        }
    }
    var controlleraddedthisstep;
    controlleraddedthisstep=false
    
    for (i=0; i<13; i+=1)
    {
        if controllerin[i]==-1 && gamepad_is_connected(i) && gamepad_button_check_pressed(i,gp_start)
        {
            controlleraddedthisstep=true
            controllerin[i]=nextopenslot
            ready[nextopenslot]=0
            control_setup[nextopenslot]=3
            player_join_update_controller_variables()
        }
    };
    if controlleraddedthisstep==false
    {      
        for (iii=0; iii<13; iii+=1)
        {
            if controllerin[iii]>-1
            {
                if gamepad_button_check_pressed(iii,gp_start)                                                                           ///start button controllers (options/lockin)
                {
                    find_first_slot()
                    
                    if ready[controllerin[iii]]==0       
                    {                       
                            ready[controllerin[iii]]+=1        
                    }            
                    else if ready[controllerin[iii]]==1                                                                                             /// lock in controllers
                    {
                        ready[controllerin[iii]]=2
                        if player_check_all_ready()
                        {
                            multiplayer_game_start_countdown()
                        }
                    }
                }          
            }
        };
    }
    

    
    
    

    character_portraits_subspr+=0.15
    if character_portraits_subspr>CHARACTER_PORTRAITS_SUBSPR_LIMIT
        character_portraits_subspr=0

    char_selectbox_subspr+=0.1
    if char_selectbox_subspr>CHAR_SELECTBOX_SUBSPR_LIMIT
        char_selectbox_subspr=0
        
        
        
if numberofkeyboardsinuse>0
{
    if keyboard_check_pressed(keyboard1_left_button)
    {
        multiplayer_menu_left_button(keyboardoneslot)
    }
    if keyboard_check_pressed(keyboard1_right_button)
    {
        multiplayer_menu_right_button(keyboardoneslot)
    }
    if keyboard_check_pressed(keyboard1_up_button)
    {
        multiplayer_menu_up_button(keyboardoneslot)
    }
    if keyboard_check_pressed(keyboard1_down_button)
    {
        multiplayer_menu_down_button(keyboardoneslot)
    }
}        
if numberofkeyboardsinuse>1
{
    if keyboard_check_pressed(keyboard2_left_button)
    {
        multiplayer_menu_left_button(keyboardtwoslot)
    }
    if keyboard_check_pressed(keyboard2_right_button)
    {
        multiplayer_menu_right_button(keyboardtwoslot)
    }
    if keyboard_check_pressed(keyboard2_up_button)
    {
        multiplayer_menu_up_button(keyboardtwoslot)
    }
    if keyboard_check_pressed(keyboard2_down_button)
    {
        multiplayer_menu_down_button(keyboardtwoslot)
    }
}        
        
                
     
        
        
        
        
        
        
        
        
        
        
}




if room==settings 
{
    if keyboard_check(keyboard1_start_button)
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

