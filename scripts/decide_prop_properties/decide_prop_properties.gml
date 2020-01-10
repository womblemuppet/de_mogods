var biome;
biome=argument0

var a,prop_type;
a=instance_create_depth(0,0,0,prop_properties)


//determine prop_type (name of prop which links to its properties)
var prop_list;
prop_list=argument1
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
	a.p_NOconnectors=1
	break;
	case "shrub_1":
	a.p_sprite=shrub_1
	a.p_sprite_die=shrub_1
	a.p_isFlag=false
	a.p_cutTerrain=false
	a.p_NOconnectors=1
	break;
	case "tree_1":
	a.p_sprite=tree_1
	a.p_sprite_die=tree_1_die
	a.p_isFlag=false
	a.p_cutTerrain=false
	a.p_NOconnectors=1
	break;
	case "tree_2":
	a.p_sprite=tree_2
	a.p_sprite_die=tree_2_die
	a.p_isFlag=false
	a.p_cutTerrain=false
	a.p_NOconnectors=1
	break;
	case "tree_3":
	a.p_sprite=tree_3
	a.p_sprite_die=tree_3_die
	a.p_isFlag=false
	a.p_cutTerrain=false
	a.p_NOconnectors=1
	break;
	case "tree_4":
	a.p_sprite=tree_4
	a.p_sprite_die=tree_4_die
	a.p_isFlag=false
	a.p_cutTerrain=false
	a.p_NOconnectors=1
	break;
	case "tiki_torch_1":
	a.p_sprite=tiki_torch_1
	a.p_sprite_die=tiki_torch_1_die
	a.p_isFlag=false
	a.p_cutTerrain=false
	a.p_NOconnectors=1
	break;
	case "tiki_torch_2":
	a.p_sprite=tiki_torch_2
	a.p_sprite_die=tiki_torch_2_die
	a.p_isFlag=false
	a.p_cutTerrain=false
	a.p_NOconnectors=1
	break;
	case "tiki_torch_3":
	a.p_sprite=tiki_torch_3
	a.p_sprite_die=tiki_torch_3_die
	a.p_isFlag=false
	a.p_cutTerrain=false
	a.p_NOconnectors=1
	break;
	case "statue_1":
	a.p_sprite=statue_1
	a.p_sprite_die=statue_1_die
	a.p_isFlag=false
	a.p_cutTerrain=false
	a.p_NOconnectors=1
	break;
	case "dedstatue_1":
	a.p_sprite=dedstatue_1
	a.p_sprite_die=dedstatue_1_die
	a.p_isFlag=false
	a.p_cutTerrain=false
	a.p_NOconnectors=1
	break;
	case "building_01":
	a.p_sprite=building_01
	a.p_sprite_die=building_01
	a.p_isFlag=false
	a.p_cutTerrain=false
	a.p_NOconnectors=3
	break;
	default:
	show_error("undef pname",true)
}

return a