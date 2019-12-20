var biome;
biome=argument0

var a,prop_type;
a=instance_create_depth(0,0,0,prop_properties)

switch biome
{
	default: 
	prop_type=choose("rock_1","shrub_1","tree_1","tiki_torch_1","statue_1")
	break;
}

a.p_name=prop_type

switch prop_type
{
	case "rock_1":
	a.p_sprite=rock_1
	a.p_sprite_die=rock_1
	a.p_isFlag=false
	a.p_cutTerrain=false
	break;
	case "shrub_1":
	a.p_sprite=shrub_1
	a.p_sprite_die=shrub_1
	a.p_isFlag=false
	a.p_cutTerrain=false
	break;
	case "tree_1":
	a.p_sprite=tree_1
	a.p_sprite_die=tree_1
	a.p_isFlag=false
	a.p_cutTerrain=false
	break;
	case "tiki_torch_1":
	a.p_sprite=tiki_torch_1
	a.p_sprite_die=tiki_torch_1
	a.p_isFlag=false
	a.p_cutTerrain=false
	break;
	case "statue_1":
	a.p_sprite=statue_1
	a.p_sprite_die=statue_1_die
	a.p_isFlag=false
	a.p_cutTerrain=false
	break;
}

return a