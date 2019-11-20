
var readgrab;


//////////////////////////////////////////////////////////////////////////////////////////// LOAD OPTIONS
if file_exists("options.txt")
{
	OPT=file_text_open_read("options.txt")
	readgrab=file_text_read_string(OPT)
	
	setmenu_fullscreen=real(string_copy(readgrab,string_pos("=",readgrab)+1,1))
	if setmenu_fullscreen==0
		setmenu_fullscreen=false
	else
		setmenu_fullscreen=true
	
	file_text_readln(OPT)
	readgrab=file_text_read_string(OPT)
		
	setmenu_scale_screen=real(string_copy(readgrab,string_pos("=",readgrab)+1,1))
	if setmenu_scale_screen==0
		setmenu_scale_screen=false
	else
		setmenu_scale_screen=true
       
	file_text_readln(OPT)  
	readgrab=file_text_read_string(OPT)    
      
	setmenu_eff_volume=real(string_copy(readgrab,string_pos("=",readgrab)+1,1))       
    
	file_text_readln(OPT) 
	readgrab=file_text_read_string(OPT)    
    
	setmenu_bgm_volume=real(string_copy(readgrab,string_pos("=",readgrab)+1,1))     
      
	file_text_readln(OPT)  
	readgrab=file_text_read_string(OPT)    
             
	setmenu_show_fps=real(string_copy(readgrab,string_pos("=",readgrab)+1,1))      
    
	if setmenu_show_fps==0
		setmenu_show_fps=false
	else
		setmenu_show_fps=true    
       
	file_text_readln(OPT)
	readgrab=file_text_read_string(OPT)
	
	setmenu_block_width=real(string_copy(readgrab,string_pos("=",readgrab)+1,2))
	setmenu_block_width=75  // (setmenu_block_width)
	
	file_text_readln(OPT)
	readgrab=file_text_read_string(OPT)
	
	setmenu_block_height=real(string_copy(readgrab,string_pos("=",readgrab)+1,2))
	setmenu_block_height=75  // real(setmenu_block_height)	
	
	file_text_readln(OPT)
	readgrab=file_text_read_string(OPT)
	
	setmenu_player_scale=real(string_copy(readgrab,string_pos("=",readgrab)+1,3))
	setmenu_player_scale=real(setmenu_player_scale)	

	file_text_close(OPT)
}
else //////////////////////////////////////////////////////////////////////////////////////////// CREATE OPTIONS FILE
{
	show_debug_message("cant find options file, creating options file")
	var OPT;
	OPT=file_text_open_write("options.txt")
	if OPT==-1
		show_error("options file can not be created",true)
	file_text_write_string(OPT,"fullscreen=0")
	file_text_writeln(OPT)
	file_text_write_string(OPT,"scale_screen=0")
	file_text_writeln(OPT)
	file_text_write_string(OPT,"eff_volume=0")
	file_text_writeln(OPT)
	file_text_write_string(OPT,"bgm_volume=0")
	file_text_writeln(OPT)
	file_text_write_string(OPT,"show_fps=1")  
	
	////testing purposes only, to be removed
	file_text_writeln(OPT)
	file_text_write_string(OPT,"block_width=75")  
	file_text_writeln(OPT)
	file_text_write_string(OPT,"block_height=75")  
	file_text_writeln(OPT)
	file_text_write_string(OPT,"player_scale=2")  
	file_text_close(OPT)    
    
	setmenu_fullscreen=true
	setmenu_scale_screen=true
	setmenu_eff_volume=0
	setmenu_bgm_volume=0
	setmenu_show_fps=true
	
	setmenu_block_width=75
	setmenu_block_height=75
	setmenu_player_scale=2
}

window_set_fullscreen(setmenu_fullscreen)

if setmenu_fullscreen==false
	setmenu_scale_screen=false
	
scale_screen=setmenu_scale_screen

if scale_screen==false && setmenu_fullscreen==true
{
	application_surface_draw_enable(false)
	var w,h;
	w=1350
	h=768
	window_set_rectangle(display_get_width()/2-(w/2),display_get_height()/2-(h/2),w,h);
	display_set_gui_size(1350,768)
}

