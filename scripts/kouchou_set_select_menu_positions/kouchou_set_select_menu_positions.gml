/***************************************************
  sets positions of the various components in character select
****************************************************/

midx=room_width/2
midy=room_height/2

charpor_w=600
charpor_h=500

///charpor_x/y are the positions of the large character arts    

if !competitive_mode
{
	charpor_x[3]=midx+600
	charpor_y[3]=midy+500
	charpor_x[0]=midx
	charpor_x[1]=midx+600
	charpor_x[2]=midx
	charpor_y[0]=midy
	charpor_y[1]=midy
	charpor_y[2]=midy+500
    
    
	for (var i=0; i<4; i+=1)
	{
		charpormid_x[i]=charpor_x[i]+charpor_w/2
		charpormid_y[i]=charpor_y[i]+charpor_h/2
	};
}
else  //competitive 1v1 mode
{   
	charpor_x[0]=0
	charpor_y[0]=room_height-750
	charpor_x[1]=room_width-550
	charpor_y[1]=room_height-750
    
    
    for (var i=0; i<4; i+=1)
	{
		charpormid_x[i]=charpor_x[i]+charpor_w/2
		charpormid_y[i]=charpor_y[i]+charpor_h/2
	};
}


////small_portrait_x and small_portrait_y are the positions of the small portrait slots

//set character select grid x positions
small_portraits_number_of_columns=10
var small_portraits_total_width;
small_portrait_w=70
small_portraits_total_width=small_portraits_number_of_columns*small_portrait_w

small_portraits_xstart=(room_width/2)-(small_portraits_total_width/2)+(small_portrait_w/2)

for (var i=0; i<number_of_characters; i++)
{
	small_portrait_x[i]=small_portraits_xstart+i*small_portrait_w
};

//set character select grid y positions
small_portraits_number_of_rows=1
var small_portrait_h,chargrid_h;
small_portrait_h=78
chargrid_h=small_portraits_number_of_rows*small_portrait_h

small_portraits_ystart=670

for (var i=0; i<number_of_characters; i++)
{
	small_portrait_y[i]=small_portraits_ystart
};


//set options box positions
if !competitive_mode
{
	for (var i=0; i<MAX_PLAYER_COUNT; i+=1)
	{
		menu_player_options_box_x[i]=charpor_x[i]
		menu_player_options_box_y[i]=charpor_y[i]
	};
}
else
{
	menu_player_slab_x[0]=225
	menu_player_slab_x[1]=room_width-225
	menu_player_slab_y[0]=100
	menu_player_slab_y[1]=100
	
	menu_player_options_box_x[0]=menu_player_slab_x[0]-100
	menu_player_options_box_x[1]=menu_player_slab_x[1]-100
	menu_player_options_box_y[0]=menu_player_slab_y[0]+270
	menu_player_options_box_y[1]=menu_player_slab_y[1]+270
}


//[finaledit] in use?
//set join prompt positions
for (var i=0; i<MAX_PLAYER_COUNT; i+=1)
{
	menu_player_join_prompt_x[i]=menu_player_options_box_x[i]
	menu_player_join_prompt_y[i]=menu_player_options_box_y[i]+100
	
	menu_player_join_prompt_middle_x[i]=menu_player_join_prompt_x[i]+327
	
	menu_player_character_title_x[i]=menu_player_options_box_x[i]+100
	menu_player_character_title_y[i]=menu_player_options_box_y[i]+270
};

//set controller/keyboard icon positions
menu_controller_x=midx
menu_controller_y=midy+225




