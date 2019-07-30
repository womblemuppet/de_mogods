////////////////////////////////////////////////////////////////////////////////// GET ULT

player_flush_lockdowns() ///be careful with this
super_mode=true
super_mode_time_remaining=super_mode_duration

image_index=0
image_speed=0.2
sprite_index=sprites[6]   ///super activate animation

switch attacks[? "ult get trigger"]
{
	case "uga_get_ult":
		orb_count_meter=0
		if uniques_super_ooga_gp_enabled==true
			unique_ooga_gp_charges=1
	break;
	case "vet_get_ult":
		//vetult
	break;
	case "slinger_get_ult":
		//slingerult
	break;
	case "bait_get_ult":
		iframes=super_mode_duration
		armouredframes=super_mode_duration
	break;
	default:
	show_error(" beopop, unknown ult get trigger attack id",true)
}

set_hud_pocket_circle_orb_super_mode()
player_update_super_meter_hud()
