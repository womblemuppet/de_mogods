COMBO_TEXT_Y_VALUE=100
last_hit_timer[0]=0
for (var i = 0; i < kouchou.MAX_PLAYER_COUNT;i++) 
{
	last_hit_timer[i]=0
}

clean_hit_count[0]=0
for (var i = 0; i < kouchou.MAX_PLAYER_COUNT;i++) 
{
	clean_hit_count[i]=0
}



last_got_hit_timer[0]=0
for (var i = 0; i <kouchou.MAX_PLAYER_COUNT;i++)
{
	last_got_hit_timer[i]=0
}

last_got_hit_by[0]=noone
for (var i ; i <kouchou.MAX_PLAYER_COUNT; i++)
{
	last_got_hit_by[i]=noone
}

TIMER_START=500
CLEAN_CUTOFF_TIME=325
CUCKED_CUTOFF_TIME=450

debug=false