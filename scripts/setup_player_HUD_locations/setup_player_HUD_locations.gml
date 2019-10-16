var n;
n=argument0

switch n
{	
	case 2:
		HUDx[0]=0
		HUDx[1]=kouchou.room_right_border_x-hud_area_width
	break;
	
	default:
	show_error("unhandled number of players in player hud location setup",true)
}