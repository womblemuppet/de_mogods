PLAYER_HUD_AREA_FULL_WIDTH=300
PLAYER_HUD_AREA_HALF_WIDTH=PLAYER_HUD_AREA_FULL_WIDTH/2
PLAYER_HUD_AREA_SIDE_OFFSET_X=50

hud_area_width=PLAYER_HUD_AREA_FULL_WIDTH
if kouchou.players_in>2
	hud_area_width=PLAYER_HUD_AREA_HALF_WIDTH

super_bar_width=300
if kouchou.players_in>2
	super_bar_width=150


setup_player_HUD_locations(kouchou.players_in)
setup_player_HUD_combo_text_locations(kouchou.players_in)
setup_player_HUD_super_bar_locations(kouchou.players_in)




for (var i = 0; i < kouchou.players_in; i++)
{
	super_bars_array[i]=setup_HUD_create_super_bar(super_bar_x[i],SUPER_BAR_Y,i,super_bar_width,10)
}


my_rage_bar=instance_create_depth(room_width/2-300,10,-9,ragebar)

var bookend_offset_x;
bookend_offset_x=35

bookend_tiki_left=instance_create_depth(my_rage_bar.x-bookend_offset_x,my_rage_bar.y,-14,ragebar_bookend_tiki)
bookend_tiki_right=instance_create_depth(my_rage_bar.x+my_rage_bar.WIDTH+bookend_offset_x,my_rage_bar.y,-14,ragebar_bookend_tiki)
bookend_tiki_right.image_xscale=-1

floating_masks_subimage=0
FLOATINGMASKS_IMAGE_NUMBER=22



///////////////////////////////
////  HUD-SIDE VARIABLES ///////////////////////////////////////////////////
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


player_hp[kouchou.MAX_PLAYER_COUNT-1]=0
for (var i=0; i<kouchou.MAX_PLAYER_COUNT;i++)
{
	player_hp[i]=kouchou.starting_hp
}

player_HUD_enabled[kouchou.MAX_PLAYER_COUNT-1]=false
for (var i=0; i<kouchou.MAX_PLAYER_COUNT; i+=1)
{
	player_HUD_enabled[i]=false
	if i<kouchou.players_in
		player_HUD_enabled[i]=true
};

