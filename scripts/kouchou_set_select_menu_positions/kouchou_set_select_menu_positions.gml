/***************************************************
  sets positions of the various components in character select
****************************************************/

midx=room_width/2-1200/2   ///until background fully covers screen, this is where to draw the old 1200,1000 background from [finaledit]
midy=room_height/2-1000/2

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
else
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


////chargrid_x and chargrid_y are the positions of the small portraits

///     0 | 1 | 2 | 3 | 4 | 5 etc
///     current layout  

chargrid_numberofcolumns=10
var smallportrait_w,chargrid_w;
smallportrait_w=70
chargrid_w=chargrid_numberofcolumns*smallportrait_w

chargrid_xstart=(room_width/2)-(chargrid_w/2)+(smallportrait_w/2)

for (var i=0; i<chargrid_numberofcolumns; i+=1)
{
	chargrid_x[i]=chargrid_xstart+i*smallportrait_w
};


chargrid_numberofrows=1
var smallportrait_h,chargrid_h;
smallportrait_h=78
chargrid_h=chargrid_numberofrows*smallportrait_h

chargrid_ystart=(room_height/2)-(chargrid_h/2)+(smallportrait_h/2)

for (var i=0; i<chargrid_numberofrows; i+=1)
{
	chargrid_y[i]=chargrid_ystart+i*smallportrait_h
};




if competitive_mode
{
	for (var i=0; i<chargrid_numberofrows; i+=1)
	{
		var c;
		c=290
		chargrid_y[i]+=c
		charpormid_y[i]+=c
	};
}


menu_player_options_x[MAX_PLAYER_COUNT]=0
menu_player_options_y[MAX_PLAYER_COUNT]=0


if !competitive_mode
{
	for (var i=0; i<MAX_PLAYER_COUNT; i+=1)
	{
		menu_player_options_x[i]=charpor_x[i]
		menu_player_options_y[i]=charpor_y[i]
	};
}
else
{
	menu_player_options_x[0]=225
	menu_player_options_x[1]=room_width-225
	menu_player_options_y[0]=100
	menu_player_options_y[1]=100
}


//[finaledit] in use?
menu_player_join_prompt_x[MAX_PLAYER_COUNT]=-1
menu_player_join_prompt_y[MAX_PLAYER_COUNT]=-1
menu_player_join_prompt_middle_x[MAX_PLAYER_COUNT]=-1

for (var i=0; i<MAX_PLAYER_COUNT; i+=1)
{
	menu_player_join_prompt_x[i]=menu_player_options_x[i]
	menu_player_join_prompt_y[i]=menu_player_options_y[i]+100
	
	menu_player_join_prompt_middle_x[i]=menu_player_join_prompt_x[i]+327
	
	menu_player_character_title_x[i]=menu_player_options_x[i]
	menu_player_character_title_y[i]=menu_player_options_y[i]+500
};






