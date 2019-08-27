/***************************************************
  Demogods (working title)
a game by jeremy wood, poe gour 

testers:
Jordan (ALT) $LASTNAME
testers I've heard of:
po's coworker couple
po's japanese student
po's fighting game friend that likes projectiles
simon
cody slater
lars hopman
jordan young
mark hamilton
john mcneil


thanks to
gamemaker - mark overmars/yoyogames (could use yoyogames logo check design requirements)
starbucks baristas in nishinasuno lol


****************************************************/

starbucksmode=false   //[finaledit]


rw=1350           ///playable game area
rh=650
room_border_width=0 ///per side ofc   [finaledit] can be local
room_left_border_x=room_border_width
room_right_border_x=rw+room_border_width
room_right_full=rw+room_border_width+room_border_width
room_x_halfway=room_left_border_x+rw/2
room_border_height=118   ///[finaledit] these can be locals
room_top_border_y=room_border_height
room_bottom_border_y=room_border_height+rh
room_y_halfway=room_top_border_y+rh/2


load_options_file()


////////////////////////////////////////////////////////////// CODES
drinkmode=false

///////////////////////////////////////////////////////////////// SCORE,PLAYERS,ROOM OPTIONS,BACKGROUND AND LOGOS


//time=0
playerwins[3]=0
playerwins[0]=0
playerwins[1]=0
playerwins[2]=0
playerhandicap[3]=0
playerhandicap[0]=0
playerhandicap[1]=0
playerhandicap[2]=0
MAX_PLAYER_COUNT=4
game_start_countdown=0



ready[MAX_PLAYER_COUNT-1]=-1    /// -1 controller not plugged in 0 = character select    1 = options   2   = locked in
for (var i=0; i<MAX_PLAYER_COUNT; i+=1)
{
	ready[i]=-1
}


players_in=0
next_open_slot=0
controller_player_slot[12]=-1   ///when controller joins, saves the player slot in this.
for (var i=0; i<12; i+=1)
{
	controller_player_slot[i]=-1
}

number_of_keyboards_in_use=0
kb1_player_slot=-1
kb2_player_slot=-1

keyboard_set_menu_key_bindings()


keybinding_map_array[MAX_PLAYER_COUNT]=undefined
for (var i=0; i<MAX_PLAYER_COUNT; i+=1)
{
	keybinding_map_array[MAX_PLAYER_COUNT]=undefined
};

DEADZONE_AMOUNT=0.3
deadzone[MAX_PLAYER_COUNT-1]=DEADZONE_AMOUNT  //[finaledit] why -1?
stick_pressed_r[MAX_PLAYER_COUNT-1]=0
stick_pressed_u[MAX_PLAYER_COUNT-1]=0
stick_pressed_l[MAX_PLAYER_COUNT-1]=0
stick_pressed_d[MAX_PLAYER_COUNT-1]=0
for (i = 0; i < MAX_PLAYER_COUNT;i++)
{
	deadzone[i]=DEADZONE_AMOUNT
	stick_pressed_r[i]=0
	stick_pressed_u[i]=0
	stick_pressed_l[i]=0
	stick_pressed_d[i]=0
}

readymenuselect[MAX_PLAYER_COUNT]=0    /// 0=control 1=handicap
for (var i=0; i<MAX_PLAYER_COUNT; i+=1)
{
	readymenuselect[i]=0
};


control_setup[MAX_PLAYER_COUNT]="kb_full"   // 0 = kb full  1 = kbnarrow(1) 2 = kbnarrow(2)  3 = controller default
for (var i=0; i<MAX_PLAYER_COUNT; i+=1)
{
	control_setup[i]="kb_full"
};

palette[MAX_PLAYER_COUNT]=0
for (var i=0; i<MAX_PLAYER_COUNT; i+=1)
{
	palette[i]=0
};




competitive_mode=false
menuselect=1
MENUSELECTMAX=6
main_menu_texts[MENUSELECTMAX]=""
main_menu_texts[0]="SINGLEPLAYER"
main_menu_texts[1]="TRYHARD VERSUS MODE"
main_menu_texts[2]="PARTY MODE"
main_menu_texts[3]="LORE"
main_menu_texts[4]="SETTINGS"
main_menu_texts[5]="EXIT"

menu_background_subspr=0
MENU_BACKGROUND_SUBSPR_LIMIT=17
menu_logo_subspr=0
MENU_LOGO_SUBSPR_LIMIT=6
char_selectbox_subspr=0
CHAR_SELECTBOX_SUBSPR_LIMIT=2
character_portraits_subspr=0
CHARACTER_PORTRAITS_SUBSPR_LIMIT=10
menu_crab_subspr=0
MENU_CRAB_SUBSPR_LIMIT=7

/////////////////////////CHARACTER SELECT

// CHARACTER LARGE BACKGROUNDS (QUADRANTS)
kouchou_set_select_menu_positions()


menu_letterbox_colour=make_colour_hsv(138,218,128)       //[finaledit]
menu_letterbox_colour=make_colour_rgb(45,126,234)


character_portraits_array[0]=character_portraits_ooga
character_portraits_array[1]=character_portraits_vet
character_portraits_array[2]=character_portraits_slinger
character_portraits_array[3]=character_portraits_bait
character_portraits_array[4]=character_portraits_bert
character_portraits_array[5]=character_portraits_jermy

selected_character_id[3]=-1
selected_character_id[1]=-1
selected_character_id[2]=-1
selected_character_id[0]=-1
selectbox_sprites[3]=character_selectboxP4
selectbox_sprites[0]=character_selectboxP1
selectbox_sprites[1]=character_selectboxP2
selectbox_sprites[2]=character_selectboxP3

CHARACTER_SELECT_OPTIONS_COLOUR[3]=c_yellow
CHARACTER_SELECT_OPTIONS_COLOUR[0]=c_red
CHARACTER_SELECT_OPTIONS_COLOUR[1]=c_blue
CHARACTER_SELECT_OPTIONS_COLOUR[2]=c_purple


/////////////////////////////////////////////////LORE MENU
lore_init()


//////////////////////////////////////////////SETTINGS MENU 
setmenu_select_number=0
SETMENU_SELECT_NUMBER_MAX=6
setmenu_select_options[SETMENU_SELECT_NUMBER_MAX]=0

setmenu_select_options[0]="fullscreen"
setmenu_select_options[1]="scale_screen"
setmenu_select_options[2]="sound_effects_volume"
setmenu_select_options[3]="background_music_volume"
setmenu_select_options[4]="fps_counter"
setmenu_select_options[5]="code"

setmenu_select=setmenu_select_options[setmenu_select_number]

setmenu_codetxt=""

starting_hp=3

trial=0
test_numberoftrials=2
/***************************************************
  trial
0=fire
1=ice
2=lightning
3=boss
****************************************************/
map="nothinginparticular"
/***************************************************
"firetrial"
"icetrial"
"lightningtrial"
"bosstrial" 
****************************************************/


buglist_text="Known bugs##"


/* */
/*  */
