/***************************************************
  Demogods (working title)
a game by jeremy wood, pobelt (sp*) 'po' $LASTNAME (swap order depending on what sounds best)

testers:
Jordan (ALT) $LASTNAME
testers I've heard of:
po's coworker couple
po's japanese student
po's fighting game friend that likes projectiles
simon
cody
lars
jordan 2
mark

thanks to
gamemaker - mark overmars/yoyogames (could use yoyogames logo)
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
    
	setmenu_graphics_fid=real(string_copy(readgrab,string_pos("=",readgrab)+1,1))    
       
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
        
	file_text_close(OPT)
}
else //////////////////////////////////////////////////////////////////////////////////////////// CREATE OPTIONS FILE
{
	//show_message("cant find options file creating options file")
	var OPT;
	OPT=file_text_open_write("options.txt")
	if OPT==-1
		show_error("options file can not be created",true)
	file_text_write_string(OPT,"fullscreen=0")
	file_text_writeln(OPT)
	file_text_write_string(OPT,"graphics_fid=1")
	file_text_writeln(OPT)
	file_text_write_string(OPT,"eff_volume=0")
	file_text_writeln(OPT)
	file_text_write_string(OPT,"bgm_volume=0")
	file_text_writeln(OPT)
	file_text_write_string(OPT,"show_fps=1")  
	file_text_close(OPT)    
    
	setmenu_fullscreen=true
	setmenu_graphics_fid=1   //0,1
	setmenu_eff_volume=0
	setmenu_bgm_volume=0
	setmenu_show_fps=true
}

window_set_fullscreen(setmenu_fullscreen)

room_goto_next()





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
startinggame=0



ready[3]=-1    /// -1 controller not plugged in 0 = character select    1 = options   2   = locked in
for (i=0; i<4; i+=1)
{
	ready[i]=-1
};




playersin=0
nextopenslot=0
controllerin[12]=-1   ///when controller joins, saves the player slot in this.
for (i=0; i<12; i+=1)
{
	controllerin[i]=-1
};

numberofkeyboardsinuse=0
keyboardoneslot=-1
keyboardtwoslot=-1
keyboard1_start_button=vk_space
keyboard1_left_button=ord("A")
keyboard1_right_button=ord("D")
keyboard1_up_button=ord("W")
keyboard1_down_button=ord("S")
keyboard2_start_button=vk_enter
keyboard2_left_button=ord("J")
keyboard2_right_button=ord("L")
keyboard2_up_button=ord("I")
keyboard2_down_button=ord("K")

keybinding_map_array[MAX_PLAYER_COUNT]=undefined
for (i=0; i<MAX_PLAYER_COUNT; i+=1)
{
	keybinding_map_array[MAX_PLAYER_COUNT]=undefined
};


readymenuselect[MAX_PLAYER_COUNT]=0    /// 0=control 1=handicap
for (i=0; i<MAX_PLAYER_COUNT; i+=1)
{
	readymenuselect[i]=0
};


control_setup[MAX_PLAYER_COUNT]=0   // 0 = kb full  1 = kbnarrow(1) 2 = kbnarrow(2)  3 = controller default
for (i=0; i<MAX_PLAYER_COUNT; i+=1)
{
	control_setup[i]=0
};

palette[MAX_PLAYER_COUNT]=0
for (i=0; i<MAX_PLAYER_COUNT; i+=1)
{
	palette[i]=0
};


menuselect=1
MENUSELECTMAX=6
main_menu_texts[MENUSELECTMAX]=""
main_menu_texts[0]="singleplayer"
main_menu_texts[1]="tryhard versus mode"
main_menu_texts[2]="party mode"
main_menu_texts[3]="lore"
main_menu_texts[4]="settings"
main_menu_texts[5]="exit"

competitive_mode=false
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
kouchou_set_charpor()




menu_letterbox_colour=make_colour_hsv(138,218,128)       //[finaledit]
menu_letterbox_colour=make_colour_rgb(45,126,234)


character_portraits_array[0]=character_portraits_ooga
character_portraits_array[1]=character_portraits_vet
character_portraits_array[2]=character_portraits_slinger
character_portraits_array[3]=character_portraits_bait
character_portraits_array[4]=character_portraits_bert
character_portraits_array[5]=character_portraits_jermy

selectchar[3]=-1
selectchar[1]=-1
selectchar[2]=-1
selectchar[0]=-1
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
ds_list_add(lore_data,"butts butts butts butts butts butts butts")
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
lore_character_select_name[0]="untitled"
string_split_lines_add_to_list("this guy is kinda strong and likes punching things.",lore_text_line_width,lore_character_select_bio_array[0])
lore_character_select_name[1]="Veteran"
string_split_lines_add_to_list("look at this dude he's got a robot arm and he likes setting traps all around the place pretty cool",lore_text_line_width,lore_character_select_bio_array[1])
lore_character_select_name[2]="Sunslinger"
string_split_lines_add_to_list("this guy is not just a guy - he can shoot pure sun beams out of his fingers.",lore_text_line_width,lore_character_select_bio_array[2])
lore_character_select_name[3]="Bait"
string_split_lines_add_to_list("long ago he lost a fight against a shark and now he's wearing a shark kickass",lore_text_line_width,lore_character_select_bio_array[3])
lore_character_select_name[4]="Bert"
string_split_lines_add_to_list("  ",lore_text_line_width,lore_character_select_bio_array[4])
lore_character_select_name[5]="jermy"
string_split_lines_add_to_list("  ",lore_text_line_width,lore_character_select_bio_array[5])





setmenu_select=0
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
