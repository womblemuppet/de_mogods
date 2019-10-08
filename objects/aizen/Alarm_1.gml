/// @description  SHIT HAPPENS
mode=2
stackframe_subimage=0
stackframe_image_number=8
stackframe_sprite=arcade_cabinet_maskbar_whoosh


with orbb
{
	alarm[1]=1   ///die
}
switch ds_list_find_value(STACK,0)
{
	case "meteors":
		instance_create(0,0,badweather) break;
	case "snowball":
		instance_create(0,0,winter) break;
	case "lightning":
		instance_create(0,0,storm) break;     
	case "payday":
		instance_create(0,0,payday) break;    
	case "lava":
		instance_create(0,0,freakyfishtime) break;
	case "tornado":
		instance_create_depth(0,0,-3,tornadoe) break;
    
	default: show_error("unknown in stack",true)
}


last_stack_sprite=STACK_ORB_SPRITES[? ds_list_find_value(STACK,0)]
ds_list_delete(STACK,0)




