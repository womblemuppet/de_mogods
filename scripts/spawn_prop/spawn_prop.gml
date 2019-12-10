var p_sprite,p_sprite_die;


var yy,block_column_number;
yy=argument0
block_column_number=argument1


var p_sprite,p_sprite_die,p_name,p_isFlag,p_cutTerrain;
switch biome
{
	case "summit":       ///decide the type of prop here
	default:
	
	p_sprite=prop_sprite_statue_1
	p_sprite_die=prop_sprite_statue_1_die
	p_name="statue1"
	p_isFlag=false
	p_cutTerrain=false
	break;
}
prop_create(kouchou.room_left_border_x+block_column_number*aizen.bw,yy,p_sprite,p_sprite_die,p_name,p_isFlag,p_cutTerrain)