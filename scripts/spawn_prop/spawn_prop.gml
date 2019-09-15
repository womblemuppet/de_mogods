var p_type,p_type_die;


var block_column_number;
block_column_number=argument1


switch biome
{
	case "summit":       ///decide the type of prop here
	default:
	p_type=prop_sprite_statue_1
	p_type_die=prop_sprite_statue_1_die
	break;
}
prop_create(kouchou.room_left_border_x+block_column_number*aizen.bw,argument0,prop_sprite_statue_1,prop_sprite_statue_1_die)