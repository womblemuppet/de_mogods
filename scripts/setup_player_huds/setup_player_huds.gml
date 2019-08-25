var n,w;
n=argument0 //number of players
w=PLAYER_HUD_AREA_WIDTH



switch n
{
	case 2:
	HUDx[0]=0
	HUDx[1]=kouchou.room_right_border_x-w
	break;
	case 3:	
	break;
	case 4:
	
	break;
	
	default:
	show_error("unexpected number of players when attempting to setup player HUDs",true);
}