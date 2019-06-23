////////////////////////////////////////////////////////////////////////////////// GET ULT

player_flush_lockdowns() ///be careful with this
super_mode=true
super_mode_time_remaining=1000
	
switch attacks[? "ult get trigger"]
{
	case 0:    ///ooga ult
		image_index=0
		image_speed=0.4
		sprite_index=sprites[6]   ///super activate animation
		orb_count_meter=0
		if uniques_super_ooga_gp_enabled==true
		{
			unique_ooga_gp_charges=2
			player_update_super_meter_hud()
		}


	break;
	
	case 1:
		//vetult
	break;
	
	default:
	show_error(" beopop, unknown ult get trigger attack id",true)
}


