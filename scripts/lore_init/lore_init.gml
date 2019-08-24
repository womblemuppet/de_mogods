

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
