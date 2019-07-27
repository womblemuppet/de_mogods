if (cangroundpound=3 && stunned_groundpound<1 && player_not_locked_down()  )   ||   airgrab_decidedir_time>0   ///allow update direction during groundpound or groundpound bounce
{
	if checkkey(leftbutton) 
	{
		image_xscale=-1
		right=false
	}
	if checkkey(rightbutton)     ///right > left
	{
		image_xscale=1
		right=true
	}
}