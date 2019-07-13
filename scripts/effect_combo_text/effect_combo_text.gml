if !instance_exists(argument0)
exit


var a;
a=instance_create_depth(argument0.x,combo_text_controller.COMBO_TEXT_Y_VALUE,1,ef_combo_text)
a.targ=argument0
a.type=argument1




if argument1=="clean"
{
	switch argument2
	{
		case 0:
		a.sprite_index=cctextspr_clean_p1
		break;
		case 1:
		a.sprite_index=cctextspr_clean_p2
		break;
		case 2:
		a.sprite_index=cctextspr_clean_p3
		break;
		case 3:
		a.sprite_index=cctextspr_clean_p4
		break;
		default:
		show_error("unknown P for cctextspr",true)
	}
	
}
else if argument1=="clean4"
{
	switch argument2
	{
		case 0:
		a.sprite_index=cctextspr_clean4_p1
		break;
		case 1:
		a.sprite_index=cctextspr_clean4_p2
		break;
		case 2:
		a.sprite_index=cctextspr_clean4_p3
		break;
		case 3:
		a.sprite_index=cctextspr_clean4_p4
		break;
		default:
		show_error("unknown P for cctextspr",true)
	}
	
}