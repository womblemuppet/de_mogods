var biome;
biome=argument0

var a,prop_type;
a=instance_create_depth(0,0,0,prop_properties)


//determine prop_type (name of prop which links to its properties)
var prop_list;
if terraintype=="startingflat"
	prop_list=choose(PROPS_SMALL,PROPS_MEDIUM)    //on starting flat disable cutting props
else
	prop_list=choose(PROPS_SMALL,PROPS_MEDIUM,PROPS_LARGE)
ds_list_shuffle(prop_list)
prop_type=prop_list[| 0]


//determine prop properties
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
	default:
	show_error("undef pname",true)
}

return a