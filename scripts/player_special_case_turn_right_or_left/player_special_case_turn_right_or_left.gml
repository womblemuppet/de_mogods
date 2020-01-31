if airgrab_decidedir_time>0   ///allow update direction during airgrab despite being locked down
{ 
	if button_scrape[? leftbutton] 
	{
		image_xscale=-1
		right=false
	}
	if button_scrape[? rightbutton]     ///(right takes priority over left)
	{
		image_xscale=1
		right=true
	}
}