switch (argument0)
{
	case 0: 
		return badweather break;
	case 1: 
		return winter break;
	case 2: 
		return storm break;
	case 3: 
		show_error("case 3 called from orb type conversion",true) break;
	case 4: 
		return freakyfishtime break;
	case 5: 
		return tornadoe break;
	case 6: 
		show_error("case 6 called from orb type conversion",true) break;
	default: show_error("sprite for instrument type unknown, arg is "+string(argument0),true)
}