var playerid;
playerid=argument0

if ready[playerid]==0
{
    switch selected_character_id[playerid]
    {
        case 0:
        selected_character_id[playerid]=1 break;
        case 1:
        selected_character_id[playerid]=2 break;
        case 2:
        selected_character_id[playerid]=3 break;
        case 3:
        selected_character_id[playerid]=0 break;
        case 4:
        selected_character_id[playerid]=0 break;
        case 5:
        selected_character_id[playerid]=0 break;            
    }
    
     with current_character_name_drawer[playerid]
	{
		mode="dying"
		hspeed=6
	}
	create_character_name_drawer(playerid)
}
if ready[playerid]==1
{
    if readymenuselect[playerid]==1
    {
        playerhandicap[playerid]+=1
        if playerhandicap[playerid]==3
            playerhandicap[playerid]=0
    }
    else if readymenuselect[playerid]==2
    {
        if palette[playerid]<3
            palette[playerid]+=1
    }
}    

