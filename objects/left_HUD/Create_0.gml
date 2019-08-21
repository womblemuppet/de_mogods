hud_player_meter[kouchou.MAX_PLAYER_COUNT-1]=0
for (var i=0; i<kouchou.MAX_PLAYER_COUNT; i+=1)
{
	hud_player_meter[i]=0
}; 

hud_player_is_in_super_mode[kouchou.MAX_PLAYER_COUNT-1]=false
for (var i=0; i<kouchou.MAX_PLAYER_COUNT; i+=1)
{
	hud_player_ult_time_remaining[i]=false
};

hud_player_ult_time_remaining[kouchou.MAX_PLAYER_COUNT-1]=0
for (var i=0; i<kouchou.MAX_PLAYER_COUNT; i+=1)
{
	hud_player_ult_time_remaining[i]=0
};
	
HUD_PLAYER_SUPER_TIME_TOTAL[kouchou.MAX_PLAYER_COUNT-1]=0
for (var i=0; i<kouchou.MAX_PLAYER_COUNT; i+=1)
{
	HUD_PLAYER_SUPER_TIME_TOTAL[i]=0
};

	
hud_pocket_has_super_mode[kouchou.MAX_PLAYER_COUNT-1]=0
for (var i=0; i<kouchou.MAX_PLAYER_COUNT; i+=1)
{
	hud_pocket_has_super_mode[i]=0
};

playerhpglow[kouchou.MAX_PLAYER_COUNT-1]=hud_floatingoogamask_glow
for (var i=0; i<kouchou.MAX_PLAYER_COUNT; i+=1)
{
	playerhpglow[i]=hud_floatingoogamask_glow
};

player_pocket_orb_sprite[kouchou.MAX_PLAYER_COUNT-1]=-1
for (var i=0; i<kouchou.MAX_PLAYER_COUNT; i+=1)
{
	player_pocket_orb_sprite[i]=-1
};

playerorbcount[kouchou.MAX_PLAYER_COUNT-1]=-1
for (var i=0; i<kouchou.MAX_PLAYER_COUNT; i+=1)
{
	playerorbcount[i]=0
};


player_draw_HUD[kouchou.MAX_PLAYER_COUNT-1]=false
for (var i=0; i<kouchou.MAX_PLAYER_COUNT; i+=1)
{
	player_draw_HUD[i]=false
	if i<kouchou.players_in
		player_draw_HUD[i]=true
};