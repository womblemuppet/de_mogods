if airgrab_decidedir_time>0   ///allow update direction during airgrab despite being locked down
{ 
	if button_scrape[? leftbutton] 
	{
		image_xscale=-scale
		right=false
	}
	if button_scrape[? rightbutton]     ///right > left
	{
		image_xscale=scale
		right=true
	}
} //(cangroundpound==3 && stunned_groundpound<1 && player_not_locked_down()  )   ||    [finaledit] afaik not needed anymore.