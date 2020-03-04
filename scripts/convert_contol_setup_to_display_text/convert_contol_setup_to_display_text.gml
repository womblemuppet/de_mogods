var setup;
setup=argument0

switch setup
{
	case "kb_full":
		return "Keyboard full"
	break;
	case "kb_left":
		return "Keyboard WASD"
	break;
	case "kb_right":
		return "Keyboard IJKL"
	break;
	case "controller_default":
		return "Controller"
	break;
	case "controller_custom":
		return "Controller custom"
	break;
}
