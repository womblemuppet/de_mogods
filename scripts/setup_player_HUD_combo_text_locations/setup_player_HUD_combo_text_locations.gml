var n,w;
n=argument0 //number of players

w=PLAYER_HUD_AREA_FULL_WIDTH
if n>2
	w=PLAYER_HUD_AREA_HALF_WIDTH


cc_text_location_combo_y=15
cc_text_location_secondary_y=65

cc_text_location_combo_x[n-1]=undefined
cc_text_location_combo_numbers_x[n-1]=undefined
cc_text_location_secondary_x[n-1]=undefined


switch n
{
	case 2:
	HUDx[0]=0
	HUDx[1]=kouchou.room_right_border_x-w
	cc_text_location_combo_x[0]=HUDx[0]+200
	cc_text_location_combo_x[1]=HUDx[1]-300
	
	cc_text_location_combo_numbers_x[0]=cc_text_location_combo_x[0]+225
	cc_text_location_combo_numbers_x[1]=cc_text_location_combo_x[1]+225
	cc_text_location_secondary_x[0]=cc_text_location_combo_x[0]
	cc_text_location_secondary_x[1]=cc_text_location_combo_x[1]
	
	break;
	case 3:	
	break;
	case 4:
	
	break;
	
	default:
	show_error("unexpected number of players when attempting to setup player HUDs",true);
}


