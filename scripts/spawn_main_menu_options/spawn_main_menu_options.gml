var yy,y_offset;
yy=380
y_offset=95

main_menu_option_components=ds_map_create() //[finaledit] check getting destroyed

var comp;
comp=create_menu_option(menuoption_back_comp,menuoption_back_comp_select,"Competitive",0,yy)
ds_map_add(main_menu_option_components,"competitive_mode",comp)

var ffa;
ffa=create_menu_option(menuoption_back_ffa,menuoption_back_ffa_select,"Free For All",0,yy+y_offset)
ds_map_add(main_menu_option_components,"party_mode",ffa)

var set;
set=create_menu_option(menuoption_back_settings,menuoption_back_settings_select,"Settings",0,yy+y_offset*2)
ds_map_add(main_menu_option_components,"settings",set)

var exitcomponent;
exitcomponent=create_menu_option(menuoption_back_exit,menuoption_back_exit_select,"Exit",0,yy+y_offset*3)
ds_map_add(main_menu_option_components,"exit",exitcomponent)


with comp
	main_menu_option_components_get_selected()
