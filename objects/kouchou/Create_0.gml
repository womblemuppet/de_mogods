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


rw=1200           ///playable game area
rh=900
room_border_width=240 ///per side ofc   [finaledit] can be local
room_left_border_x=room_border_width
room_right_border_x=rw+room_border_width
room_right_full=rw+room_border_width+room_border_width
room_x_halfway=room_left_border_x+rw/2
room_border_height=25     ///[finaledit] these can be locals
room_top_border_y=room_border_height
room_bottom_border_y=room_border_height+rh
room_y_halfway=room_top_border_y+rh/2


var readgrab;


//////////////////////////////////////////////////////////////////////////////////////////// LOAD OPTIONS
if file_exists("options.txt")
{
	OPT=file_text_open_read("options.txt")
	readgrab=file_text_read_string(OPT)
	
	setmenu_fullscreen=real(string_copy(readgrab,string_pos("=",readgrab)+1,1))
	if setmenu_fullscreen==0
		setmenu_fullscreen=false
	else
		setmenu_fullscreen=true
	
	file_text_readln(OPT)
	readgrab=file_text_read_string(OPT)
		
	setmenu_scale_screen=real(string_copy(readgrab,string_pos("=",readgrab)+1,1))
	if setmenu_scale_screen==0
		setmenu_scale_screen=false
	else
		setmenu_scale_screen=true
       
	file_text_readln(OPT)  
	readgrab=file_text_read_string(OPT)    
      
	setmenu_eff_volume=real(string_copy(readgrab,string_pos("=",readgrab)+1,1))       
    
	file_text_readln(OPT) 
	readgrab=file_text_read_string(OPT)    
    
	setmenu_bgm_volume=real(string_copy(readgrab,string_pos("=",readgrab)+1,1))     
      
	file_text_readln(OPT)  
	readgrab=file_text_read_string(OPT)    
             
	setmenu_show_fps=real(string_copy(readgrab,string_pos("=",readgrab)+1,1))      
    
	if setmenu_show_fps==0
		setmenu_show_fps=false
	else
		setmenu_show_fps=true    
       
	file_text_readln(OPT)
	readgrab=file_text_read_string(OPT)
	
	setmenu_block_width=real(string_copy(readgrab,string_pos("=",readgrab)+1,1))
	setmenu_block_width=real(setmenu_block_width)
	
	file_text_readln(OPT)
	readgrab=file_text_read_string(OPT)
	
	setmenu_block_height=real(string_copy(readgrab,string_pos("=",readgrab)+1,1))
	setmenu_block_height=real(setmenu_block_height)	
	
	file_text_readln(OPT)
	readgrab=file_text_read_string(OPT)
	
	setmenu_player_scale=real(string_copy(readgrab,string_pos("=",readgrab)+1,1))
	setmenu_player_scale=real(setmenu_player_scale)	

	file_text_close(OPT)
}
else //////////////////////////////////////////////////////////////////////////////////////////// CREATE OPTIONS FILE
{
	show_debug_message("cant find options file, creating options file")
	var OPT;
	OPT=file_text_open_write("options.txt")
	if OPT==-1
		show_error("options file can not be created",true)
	file_text_write_string(OPT,"fullscreen=0")
	file_text_writeln(OPT)
	file_text_write_string(OPT,"scale_screen=0")
	file_text_writeln(OPT)
	file_text_write_string(OPT,"eff_volume=0")
	file_text_writeln(OPT)
	file_text_write_string(OPT,"bgm_volume=0")
	file_text_writeln(OPT)
	file_text_write_string(OPT,"show_fps=1")  
	
	////testing purposes only, to be removed
	file_text_writeln(OPT)
	file_text_write_string(OPT,"show_fps=1")  
	file_text_writeln(OPT)
	file_text_write_string(OPT,"show_fps=1")  
	file_text_writeln(OPT)
	file_text_write_string(OPT,"show_fps=1")  
	file_text_close(OPT)    
    
	setmenu_fullscreen=true
	setmenu_scale_screen=true
	setmenu_eff_volume=0
	setmenu_bgm_volume=0
	setmenu_show_fps=true
}

window_set_fullscreen(setmenu_fullscreen)
if setmenu_scale_screen==false
{
	application_surface_draw_enable(false)  ///has to be called each room start
	var w,h;
	w=1680
	h=950
	window_set_rectangle(display_get_width()/2-(w/2),display_get_height()/2-(h/2),w,h);
	display_set_gui_size(1680,950)
}



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
kb1_start_button=vk_space
kb1_left_button=ord("A")
kb1_right_button=ord("D")
kb1_up_button=ord("W")
kb1_down_button=ord("S")
kb2_start_button=vk_enter
kb2_left_button=ord("J")
kb2_right_button=ord("L")
kb2_up_button=ord("I")
kb2_down_button=ord("K")

keybinding_map_array[MAX_PLAYER_COUNT]=undefined
for (var i=0; i<MAX_PLAYER_COUNT; i+=1)
{
	keybinding_map_array[MAX_PLAYER_COUNT]=undefined
};

DEADZONE_AMOUNT=0.3
deadzone[MAX_PLAYER_COUNT-1]=DEADZONE_AMOUNT
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



loreselect=0
lorescroll=0
lorebackselect=false
LORELISTNUMBER=8
lore_list=ds_list_create()
ds_list_add(lore_list,"lore 1","lore 2","lore 3","lore 4","lore 5","lore 6","lore 7","lore 8","lore 9","lore 10","lore 11","lore 12","lore 13","lore 14","lore 15","lore 16")
lore_data=ds_list_create()
ds_list_add(lore_data,"blah blah blah blah blah blah blah blah")
ds_list_add(lore_data,"lolololololololololololololololololol")


lore_character_select_bio_0=ds_list_create()
lore_character_select_bio_1=ds_list_create()
lore_character_select_bio_2=ds_list_create()
lore_character_select_bio_3=ds_list_create()
lore_character_select_bio_4=ds_list_create()
lore_character_select_bio_5=ds_list_create()
lore_character_select_bio_array=[lore_character_select_bio_0,lore_character_select_bio_1,lore_character_select_bio_2,lore_character_select_bio_3,lore_character_select_bio_4,lore_character_select_bio_5];


var lore_text_line_width;
lore_text_line_width=450
lore_character_select_name[0]="Uga"
string_split_lines_add_to_list("In me is the fire that burns the sun and dries the oceans. I will ascend.",lore_text_line_width,lore_character_select_bio_array[0])
lore_character_select_name[1]="Veteran"
string_split_lines_add_to_list("The islanders say theres something in this jungle, attacks without warning, a savage, a solitary predator with glowing red eyes. All I ever see out here is dead people an my own reflection",lore_text_line_width,lore_character_select_bio_array[1])
lore_character_select_name[2]="Sunslinger"
string_split_lines_add_to_list("The resort goers have seen him annually for as long as anyone can remember. Sitting in the sunbaked sand, regretfully, like it was once a piece of him",lore_text_line_width,lore_character_select_bio_array[2])
lore_character_select_name[3]="Bait"
string_split_lines_add_to_list("Sharks die if they stop moving, Bro.",lore_text_line_width,lore_character_select_bio_array[3])
lore_character_select_name[4]="Bert"
string_split_lines_add_to_list(".",lore_text_line_width,lore_character_select_bio_array[4])
lore_character_select_name[5]="jermy"
string_split_lines_add_to_list(".",lore_text_line_width,lore_character_select_bio_array[5])






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
