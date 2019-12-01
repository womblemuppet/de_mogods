PLAYER_HUD_AREA_FULL_WIDTH=300
PLAYER_HUD_AREA_HALF_WIDTH=PLAYER_HUD_AREA_FULL_WIDTH/2
PLAYER_HUD_AREA_SIDE_OFFSET_X=50

half_size_hud=false
hud_area_width=PLAYER_HUD_AREA_FULL_WIDTH
if kouchou.players_in>2
{
	hud_area_width=PLAYER_HUD_AREA_HALF_WIDTH
	half_size_hud=true
}

super_bar_width=300
if kouchou.players_in>2
	super_bar_width=150


setup_player_HUD_locations(kouchou.players_in)
setup_player_HUD_combo_text_locations(kouchou.players_in)
setup_player_HUD_super_bar_locations(kouchou.players_in)
setup_player_HUD_health_bar_locations(kouchou.players_in)


for (var i = 0; i < kouchou.players_in; i++)
{
	super_bars_array[i]=setup_HUD_create_super_bar(super_bar_x[i],SUPER_BAR_Y,i,super_bar_width,10)
}


my_rage_bar=instance_create_depth(room_width/2-300,10,-9,ragebar)


for (var playerId = 0; playerId < kouchou.players_in; playerId++)
{
	health_bars_array[playerId]=instance_create_depth(health_bar_x[playerId],health_bar_y[playerId],-9,healthbar)
	health_bars_array[playerId].H=kouchou.starting_hp+kouchou.playerhandicap[playerId]
	
	if half_size_hud
		health_bars_array[playerId].sprite_index=spr_health_bar
	else
		health_bars_array[playerId].sprite_index=spr_health_bar
		
	health_bars_array[playerId].WIDTH=health_bars_array[playerId].sprite_width
	for (var ii = 0; ii < 5; ii++)
	    health_bars_array[playerId].segments_x[ii]=19+48*ii
}



var bookend_offset_x;
bookend_offset_x=35

bookend_tiki_left=instance_create_depth(my_rage_bar.x-bookend_offset_x,my_rage_bar.y,-14,ragebar_bookend_tiki)
bookend_tiki_right=instance_create_depth(my_rage_bar.x+my_rage_bar.WIDTH+bookend_offset_x,my_rage_bar.y,-14,ragebar_bookend_tiki)
bookend_tiki_right.image_xscale=-1

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

player_HUD_enabled[kouchou.MAX_PLAYER_COUNT-1]=false
for (var i=0; i<kouchou.MAX_PLAYER_COUNT; i+=1)
{
	player_HUD_enabled[i]=false
	if i<kouchou.players_in
		player_HUD_enabled[i]=true
};

