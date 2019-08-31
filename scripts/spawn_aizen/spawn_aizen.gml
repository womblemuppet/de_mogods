/*
  spawn_aizen(previous player_priority)  //-1 for none
*/

var a;
a=instance_create(x,y,aizen)    ///the birth of a monster

if argument0==-1
a.player_priority=irandom(kouchou.players_in-1)+1
else
{
	a.player_priority=player_priority+1
	if a.player_priority>kouchou.players_in
		a.player_priority=1	
}

a.bh=kouchou.setmenu_block_height
a.bw=kouchou.setmenu_block_width

with a
	tergen_init()  //delayed as relies on bh/bw being set
	    
///// creates a new array of player slots with a controller id attached, to be used to give player objects pad numbers
with a
{
	temporary_player_controller_pad_numbers[12]=-1
	for (var i=0; i<12; i+=1)
	{
		temporary_player_controller_pad_numbers[i]=-1
	};
        
	for (var i=0; i<12; i+=1)
	{
		if kouchou.controller_player_slot[i]!=-1
		{
			temporary_player_controller_pad_numbers[kouchou.controller_player_slot[i]]=i
			//show_message("setting temporary_player_controller_pad_numbers "+string(kouchou.controller_player_slot[i])+" to "+string(i))
		}
	};
}
    