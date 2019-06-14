/***************************************************
  player_join_update_controller_variables
  updates players_in and first,secondkeyboardoption variables
  
  to be called when a player joins or leaves
****************************************************/


//reset
players_in=0
number_of_keyboards_in_use=0
kb1_player_slot=-1
kb2_player_slot=-1



for (i=0; i<MAX_PLAYER_COUNT; i+=1)
{
	if ready[i]!=-1
	{
		players_in+=1
		if control_setup[i]!=3
		{
			if number_of_keyboards_in_use==0
			              kb1_player_slot=i
			else
			              kb2_player_slot=i
				
			number_of_keyboards_in_use+=1            
		}
	}    
};

set_next_open_slot()
