var txt;
txt=keyboard_string

if txt==""
	exit


txt=string_replace_all(txt,"_"," ")
txt=string_lower(txt)

console_log(txt)


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
	
	case "slow":
	case "slow mode":
	
	room_speed=10
	
	break;
	
	case "slow off":
	case "slow mode off":
	
	room_speed=60
	
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
		with mine
			sprite_index=mask_index
	}
	else
	{
		aizen.debug_show_hitboxes=true
		with hitbox
			visible=false
		with dashattack
			visible=false
		with mine
			sprite_index=mine_sprite
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
	
	case "restart":
		game_restart()
	break;
	
	case "quit":
	case "exit":
		game_end()
	break;
	
	case "shitcall":
		with aizen
			start_shitcall()
	break;
	
	case "crab":
		with instance_create_depth(player.x,player.y-100,-3,crab)
			critter_throwable_setup("goat")
	break;

	default:
		console_log("unknown command")
	break;
}



keyboard_string=""