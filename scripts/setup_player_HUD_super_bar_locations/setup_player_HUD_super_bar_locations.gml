var n;
n=argument0 //number of players


SUPER_BAR_Y=75


switch n
{
	case 2:
		super_bar_x[0]=HUDx[0]+80
		super_bar_x[1]=HUDx[1]+80
	break;

	default:
	show_error("unexpected number of players when attempting to setup player HUD super meters",true);
}
