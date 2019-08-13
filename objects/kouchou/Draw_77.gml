if setmenu_scale_screen
{
	if !window_get_fullscreen()
		draw_surface_ext(application_surface,0,0,1,1,0,c_white,1)
}
else
{
    var w,h;
    w=1680
    h=960
    draw_surface_ext(application_surface,display_get_width()/2-(w/2),display_get_height()/2-(h/2),1,1,0,c_white,1)
}
//draw_surface_ext(application_surface,display_get_width()/2-(w/2),display_get_height()/2-(h/2),1,1,0,c_white,1)

