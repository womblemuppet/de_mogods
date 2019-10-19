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
}