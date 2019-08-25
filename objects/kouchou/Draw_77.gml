if !scale_screen && window_get_fullscreen()   ///[finaledit] should be one variable to check, set after options change/start
{
	var w,h;
	w=1350
	h=768
	draw_surface_ext(application_surface,display_get_width()/2-(w/2),display_get_height()/2-(h/2),1,1,0,c_white,1)
}
else
{
	//draw_surface_ext(application_surface,0,0,1,1,0,c_white,1)
}
//draw_surface_ext(application_surface,display_get_width()/2-(w/2),display_get_height()/2-(h/2),1,1,0,c_white,1)

