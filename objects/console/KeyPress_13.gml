var txt,stacktype;
txt=keyboard_string

if txt==""
	exit

stacktype=""

txt=string_replace_all(txt,"_"," ")
txt=string_lower(txt)

console_log(txt)

if string_count("stack",txt)>0
{
	stacktype=txt
	stacktype=string_delete(stacktype,1,6)
	
	txt="stack"
}
else if string_count("call",txt)>0
{
	stacktype=txt
	stacktype=string_delete(stacktype,1,5)
	txt="call"
}


switch txt
{
	case "clear":
	
	ds_list_clear(log)
	log_pos=0
	log_pos_last=0
	break;
	
	case "practice":
	
	with player
		H+=9999
	console_log("infinite hp mode")
	
	break;
	
	case "hitbox":
	case "hitboxes":
	case "show hitboxes":
	case "show hitbox":
	case "draw hitbox":
	case "draw hitboxes":
	
	if aizen.debug_show_hitboxes
	{
		aizen.debug_show_hitboxes=false
		with hitbox
			visible=true
		with dashattack
			visible=true
	}
	else
	{
		aizen.debug_show_hitboxes=true
		with hitbox
			visible=false
		with dashattack
			visible=false
	}

	if aizen.debug_show_hitboxes
		console_log("draw hitboxes enabled")
	else
		console_log("draw hitboxes disabled")

	break;
	
	case "super":
	case "super mode":
	
	console_log("super modes forced")
	with player
		player_activate_super_mode()
		
	break;

	case "slinger phase":
	case "phase":
	case "stance phase":
	
	console_log("slinger phase forced")
	with player
	{
		if character=="slinger"
			attack_slinger_enter_phase()
	}	
		
	break;
	
	case "restart":
		game_restart()
	break;
	
	case "quit":
	case "exit":
		game_end()
	break;
	
	case "stack":
	case "call":
	
	var orb_type;
	orb_type=undefined
	
	switch stacktype
	{
		case "meteor":
		case "meteors":
		orb_type=0
		break;
		
		case "ice":
		case "icicles":
		case "winter":
		case "cold":
		orb_type=1
		break
		
		case "storm":
		case "zap":
		case "lightning":
		orb_type=2
		break;
		
		case "fish":
		case "water":
		case "wave":
		case "waves":
		case "freakyfishtime":
		orb_type=4
		break;
		
		case "tornado":
		case "tornadoe":
		orb_type=5
		break;
	}

	
	if orb_type==undefined
		console_log("unknown orb type "+stacktype)
	else
	{
		if txt=="stack"
		{
			stack_add_orb(orb_type,true)
			console_log(stacktype+" added to stack")
		}
		else if txt=="call"
		{
			instance_create(0,0,convert_orb_type_to_orb_parent(orb_type))
			console_log(stacktype+" called")
		}
		else
			show_error("stack call case has neither stack or call effect",true)
	}
	

	break;
	
	//console_log(object_get_name(convert_orb_type_to_orb_parent(orb_type))
	default:
		console_log("unknown command")
	break;
}

keyboard_string=""