/***************************************************
  player_join_update_controller_variables
  updates playersin and first,secondkeyboardoption variables
  
  to be called when a player joins or leaves
****************************************************/

playersin=0
numberofkeyboardsinuse=0
keyboardoneslot=-1
keyboardtwoslot=-1
for (i=0; i<3; i+=1)
{
    if ready[i]!=-1
    {
        playersin+=1
        if control_setup[i]!=3
        {
            if numberofkeyboardsinuse==0
                keyboardoneslot=i
            else
                keyboardtwoslot=i
            numberofkeyboardsinuse+=1            
        }
    }    
};

find_first_slot()
