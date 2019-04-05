controltype[0]="kb1"
bindingsetupmap=ds_map_create()
keyboard1setup=ds_map_create()
ds_map_add(bindingsetupmap,"kb1",keyboard1setup)
ds_map_add(keyboard1setup,"left",vk_left)
ds_map_add(keyboard1setup,"up",vk_up)
ds_map_add(keyboard1setup,"right",vk_right)
ds_map_add(keyboard1setup,"down",vk_down)

///the above will get imported from the options file     ^


MODE=0
/***************************************************
    MODE
0=free
1=dialogue/cutscene
5=action happening
****************************************************/

dialogue_to_draw=""


overworld_room=0   //these will be loaded
player_start_x=400  
player_start_y=400

/***************************************************
  overworld_room
  
0=world
10=shop1
11=shop2
****************************************************/


counter=0
dialogue_array_of_lists[counter]=-1
dialogue_map=ds_map_create()
DIA=file_text_open_read("dialogue.txt")
if DIA==-1
    show_error("cannot find dialogue.txt,aborting",true)
whilefuse=0

//(after ensuring the next line is a NAME id)  V


///load in dialogue from file into a map structure with NPC name as key and value as a list (the index of which is stored in an array)
var grab,namegrab;
 

while !file_text_eof(DIA)
{
    
    grab=file_text_read_string(DIA)////^ important   ^
    file_text_readln(DIA)    
    namegrab=string_replace(grab,"NAME:","")
    dialogue_array_of_lists[counter]=ds_list_create()
    ds_map_add(dialogue_map,namegrab,dialogue_array_of_lists[counter])    
    whilefuse=0
    
    grab=file_text_read_string(DIA)
    file_text_readln(DIA)
    while (string_pos("END",grab)==0) && (whilefuse<100)
    {
        whilefuse+=1
        ds_list_add(dialogue_array_of_lists[counter],grab)
        grab=file_text_read_string(DIA)
        file_text_readln(DIA)
    }
    if whilefuse>=99
        show_error("whilefuse 100",true)
    
    counter+=1
}


//[finaledit] kill all of these data structures when leaving


room_goto_next()    


/* */
/*  */
