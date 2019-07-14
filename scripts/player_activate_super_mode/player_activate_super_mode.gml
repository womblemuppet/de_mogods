////////////////////////////////////////////////////////////////////////////////// GET ULT

player_flush_lockdowns() ///be careful with this
super_mode=true
super_mode_time_remaining=super_mode_duration

image_index=0
image_speed=0.2
sprite_index=sprites[6]   ///super activate animation

switch attacks[? "ult get trigger"]
{
	case 0:    ///ooga ult
		orb_count_meter=0
		if uniques_super_ooga_gp_enabled==true
			unique_ooga_gp_charges=1
	break;
	case 1:
		//vetult
	break;
	case 2:
	
	break;
	case 3:
	
	break;
	default:
	show_error(" beopop, unknown ult get trigger attack id",true)
}

player_update_super_meter_hud()
