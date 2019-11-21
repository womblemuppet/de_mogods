var yy,y_offset;
y_offset=60
yy=550

main_menu_option_components=ds_map_create() //[finaledit] check getting destroyed

var comp;
comp=create_menu_option(menuoption_back_comp,menuoption_back_comp_select,"competitive",0,yy+y_offset)
ds_map_add(main_menu_option_components,"competitive_mode",comp)

var ffa;
ffa=create_menu_option(menuoption_back_ffa,menuoption_back_ffa_select,"free for all",0,yy+y_offset*2)
ds_map_add(main_menu_option_components,"party_mode",ffa)

var set;
set=create_menu_option(menuoption_back_settings,menuoption_back_settings_select,"settings",0,yy+y_offset*3)
ds_map_add(main_menu_option_components,"settings",set)

var exitcomponent;
exitcomponent=create_menu_option(menuoption_back_exit,menuoption_back_exit_select,"exit",0,yy+y_offset*4)
ds_map_add(main_menu_option_components,"exit",exitcomponent)

