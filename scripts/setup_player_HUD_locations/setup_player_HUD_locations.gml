var n;
n=argument0

switch n
{
	case 2:
		HUDx[0]=PLAYER_HUD_AREA_SIDE_OFFSET_X
		HUDx[1]=room_width-hud_area_width-PLAYER_HUD_AREA_SIDE_OFFSET_X
	break;
	
	default:
	show_error("unhandled number of players in player hud location setup",true)
}