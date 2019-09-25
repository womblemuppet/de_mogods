if ready[argument0]==0
{
    switch selected_character_id[argument0]
    {
        case 0:
        selected_character_id[argument0]=1 break;
        case 1:
        selected_character_id[argument0]=2 break;
        case 2:
        selected_character_id[argument0]=3 break;
        case 3:
        selected_character_id[argument0]=0 break;
        case 4:
        selected_character_id[argument0]=0 break;
        case 5:
        selected_character_id[argument0]=0 break;            
    }
}
if ready[argument0]==1
{
    if readymenuselect[argument0]==1
    {
        playerhandicap[argument0]+=1
        if playerhandicap[argument0]==3
            playerhandicap[argument0]=0
    }
    else if readymenuselect[argument0]==2
    {
        if palette[argument0]<3
            palette[argument0]+=1
    }
}    

