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

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////   GUI   /////////
METER_BACKGROUND_COLOUR=make_colour_rgb(17,255,61)
METER_COLOUR_NORMAL= make_colour_rgb(237,255,216)
METER_COLOUR_ULTING = c_aqua


player_meter[kouchou.MAX_PLAYER_COUNT-1]=0
for (var i=0; i<kouchou.MAX_PLAYER_COUNT; i+=1)
{
	player_meter[i]=0
}; 

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

player_hp_glow_spr[kouchou.MAX_PLAYER_COUNT-1]=hud_floatingoogamask_glow
for (var i=0; i<kouchou.MAX_PLAYER_COUNT; i+=1)
{
	player_hp_glow_spr[i]=hud_floatingoogamask_glow
};

player_pocket_orb_sprite[kouchou.MAX_PLAYER_COUNT-1]=-1
for (var i=0; i<kouchou.MAX_PLAYER_COUNT; i+=1)
{
	player_pocket_orb_sprite[i]=-1
};

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