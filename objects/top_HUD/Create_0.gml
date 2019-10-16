PLAYER_HUD_AREA_FULL_WIDTH=625
PLAYER_HUD_AREA_HALF_WIDTH=PLAYER_HUD_AREA_FULL_WIDTH/2

hud_area_width=PLAYER_HUD_AREA_FULL_WIDTH
if kouchou.players_in>2
	hud_area_width=PLAYER_HUD_AREA_HALF_WIDTH
	


setup_player_HUD_locations(kouchou.players_in)
setup_player_HUD_combo_text_locations(kouchou.players_in)
setup_player_HUD_super_bar_locations(kouchou.players_in)

super_bar_width=500
if kouchou.players_in>2
	super_bar_width=250


for (var i = 0; i < kouchou.players_in; i++)
{
	super_bars_array[kouchou.MAX_PLAYER_COUNT]=setup_HUD_create_super_bar(super_bar_x[i],SUPER_BAR_Y,i,super_bar_width,12)
}




//create_super_bar(x,y,ID,width)

floating_masks_subimage=0
FLOATINGMASKS_IMAGE_NUMBER=22

pocket_circle_subimage[kouchou.MAX_PLAYER_COUNT-1]=0
pocket_circle_image_number[kouchou.MAX_PLAYER_COUNT-1]=1
for (var i = 0; i < kouchou.MAX_PLAYER_COUNT; i++)
{
	pocket_circle_subimage[i]=0
	pocket_circle_image_number[i]=1
	pocket_circle_sprite[i]=hud_pocket_circle_area
}

POCKET_CIRCLE_AREA_IMAGE_NUMBER=1
POCKET_CIRCLE_AREA_HAS_SUPER_MODE_IMAGE_NUMBER=6
POCKET_CIRCLE_AREA_ORB_LOST_IMAGE_NUMBER=8


///////////////////////////////
////  HUD-SIDE VARIABLES //////
///////////////////////////////

player_is_in_super_mode[kouchou.MAX_PLAYER_COUNT-1]=false
for (var i=0; i<kouchou.MAX_PLAYER_COUNT; i+=1)
{
	player_ult_time_remaining[i]=false
};

player_ult_time_remaining[kouchou.MAX_PLAYER_COUNT-1]=0
for (var i=0; i<kouchou.MAX_PLAYER_COUNT; i+=1)
{
	player_ult_time_remaining[i]=0
};
	
PLAYER_SUPER_TIME_TOTAL[kouchou.MAX_PLAYER_COUNT-1]=0
for (var i=0; i<kouchou.MAX_PLAYER_COUNT; i+=1)
{
	PLAYER_SUPER_TIME_TOTAL[i]=0
};

	
pocket_has_super_mode[kouchou.MAX_PLAYER_COUNT-1]=0
for (var i=0; i<kouchou.MAX_PLAYER_COUNT; i+=1)
{
	pocket_has_super_mode[i]=0
};


player_hp[kouchou.MAX_PLAYER_COUNT-1]=0
for (var i=0; i<kouchou.MAX_PLAYER_COUNT;i++)
{
	player_hp[i]=kouchou.starting_hp
}

player_orb_count[kouchou.MAX_PLAYER_COUNT-1]=-1
for (var i=0; i<kouchou.MAX_PLAYER_COUNT; i+=1)
{
	player_orb_count[i]=0
};


player_HUD_enabled[kouchou.MAX_PLAYER_COUNT-1]=false
for (var i=0; i<kouchou.MAX_PLAYER_COUNT; i+=1)
{
	player_HUD_enabled[i]=false
	if i<kouchou.players_in
		player_HUD_enabled[i]=true
};

