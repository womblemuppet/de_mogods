if other!=creator 
{   
	if other.groundcheck==noone
	{
		var grabbed;
		grabbed=other
		with creator
		{
			airgrab_mode=2
			hspd=0
			vspd=0
			airgrab_decidedir_time=AIRGRAB_TIME_TO_DECIDE
			airgrab_target=grabbed
		}
		with other
		{
			player_flush_lockdowns()
			hspd=0
			vspd=0
			airgrab_mode=4
		}
		instance_destroy()
	}
}

