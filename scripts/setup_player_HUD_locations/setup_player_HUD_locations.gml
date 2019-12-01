var n;
n=argument0

switch n
{
	case 2:
		HUDx[0]=PLAYER_HUD_AREA_SIDE_OFFSET_X
		HUDx[1]=room_width-hud_area_width-PLAYER_HUD_AREA_SIDE_OFFSET_X
		HUDy[0]=5
		HUDy[1]=5
	break;
	
	default:
	show_error("unhandled number of players in player hud location setup",true)
}