var playerId;
playerId=argument0

if ready[playerId]==0
{
/*
    switch selected_character_id[playerId]
    {
        case 0:
        selected_character_id[playerId]=3 break;
        case 1:
        selected_character_id[playerId]=4 break;
        case 2:
        selected_character_id[playerId]=5 break;
        case 3:
        selected_character_id[playerId]=0 break;
        case 4:
        selected_character_id[playerId]=1 break;
        case 5:
        selected_character_id[playerId]=2 break;            
    }*/
}
if ready[playerId]==1
{
    if readymenuselect[playerId]==0
        readymenuselect[playerId]=1
    else if readymenuselect[playerId]==1
        readymenuselect[playerId]=2
	   
	character_select_options_box_id[playerId].select=readymenuselect[playerId]
}
