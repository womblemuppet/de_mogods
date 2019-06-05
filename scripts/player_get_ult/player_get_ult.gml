////////////////////////////////////////////////////////////////////////////////// GET ULT

player_flush_lockdowns() ///be careful with this
super_mode=true
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
			aizen.playersupercount[P]=unique_ooga_gp_charges
		}
	    aizen.playerulttimeindex[P]=1
	    alarm[7]=29  ///ticker towards running out of ult
    break;
	
    case 1:
		uniques_veteran_ultstock=3
    break;
	
    default:
    show_error(" beopop, unknown ult get trigger attack id",true)
}


