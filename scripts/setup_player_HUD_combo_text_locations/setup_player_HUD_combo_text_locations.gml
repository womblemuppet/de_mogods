var n;
n=argument0 //number of players



cc_text_location_combo_y=15
cc_text_location_secondary_y=65

switch n
{
	case 2:
		cc_text_location_combo_x[0]=HUDx[0]+200
		cc_text_location_combo_x[1]=HUDx[1]+200
	
		cc_text_location_combo_numbers_x[0]=cc_text_location_combo_x[0]+225
		cc_text_location_combo_numbers_x[1]=cc_text_location_combo_x[1]+225
	
		cc_text_location_secondary_x[0]=cc_text_location_combo_x[0]
		cc_text_location_secondary_x[1]=cc_text_location_combo_x[1]
	break;
	
	default:
	show_error("unexpected number of players when attempting to setup player HUD cctext locations",true);
}


