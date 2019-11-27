var playerId;
playerId=argument0

if ready[playerId]==0
{
	var switching_sides;
	switching_sides=false
	switch selected_character_id[playerId]
	{
		case 0:
		selected_character_id[playerId]=3 
		switching_sides=true			break;
		case 1:
		selected_character_id[playerId]=0	break;
		case 2:
		selected_character_id[playerId]=1	break;
		case 3:
		selected_character_id[playerId]=2	break;
		case 4:
		selected_character_id[playerId]=3	break;
		case 5:
		selected_character_id[playerId]=4	break;            
	}
	var spirit;
	spirit=select_spirits_ids[playerId]
	spirit.moving="left"
	spirit.xtarget=small_portrait_x[selected_character_id[playerId]]
	if switching_sides
		spirit.x=small_portrait_x[selected_character_id[playerId]]+small_portrait_w
	
	with current_character_name_drawer[playerId]
	{
		mode="dying"
		hspeed=-6
	}
	create_character_name_drawer(playerId)
}
if ready[playerId]==1
{
	if readymenuselect[playerId]==1
	{
		playerhandicap[playerId]-=1
		if playerhandicap[playerId]==-1
			playerhandicap[playerId]=2
	}
	else if readymenuselect[playerId]==2
	{
	     if palette[playerId]>0
	          palette[playerId]-=1
	}
}
