for (var i = 0; i < kouchou.MAX_PLAYER_COUNT;i++)
{
	if last_hit_timer[i]>0
	{
		last_hit_timer[i]-=1
		if last_hit_timer[i]==CLEAN_CUTOFF_TIME
		{
			clean_hit_count[i]=0
			//show_debug_message("clean timeout : (")
		}
	}
	
	if last_got_hit_timer[i]>0
	{
		last_got_hit_timer[i]-=1
		if last_got_hit_timer[i]==0
			last_got_hit_by[i]=noone
	}

}

