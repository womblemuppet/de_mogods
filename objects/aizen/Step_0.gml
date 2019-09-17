if pausescreen_doubletap_counter>0
	pausescreen_doubletap_counter-=1

top_of_screen_warning_subimage+=1
if top_of_screen_warning_subimage>9
	top_of_screen_warning_subimage=0


stackframe_subimage+=0.2
if stackframe_subimage>stackframe_image_number
{
	stackframe_subimage=0    
}

fossil_surface_redraw_needed=false


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////   trial modes score ticker
if kouchou.map=="firetrial" || kouchou.map=="icetrial"
{
	if instance_exists(player)
		scoer+=1
}


