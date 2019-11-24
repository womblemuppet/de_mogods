var setup;
setup=argument0

switch setup
{
	case "kb_full":
		return "Keyboard full"
	break;
	case "kb_left":
		return "Keyboard narrow left"
	break;
	case "kb_right":
		return "Keyboard narrow right"
	break;
	case "controller_default":
		return "Controller"
	break;
	case "controller_custom":
		return "Controller custom"
	break;
}
