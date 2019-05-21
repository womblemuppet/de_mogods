/***************************************************
  draw_blocks_and_fossils()
  call only once
****************************************************/

var xx,yy;
with block
{   
	draw_sprite(sprite_index,image_index,x,y)
    //if divisible //terrain_special_block_draw_ok()
    //{ 
	/*
	if y<room_height
	{
	    xx=x-camera_get_view_x(aizen.main_cam)
		yy=y-camera_get_view_y(aizen.main_cam)+aizen.surface_redraw_counter      
        
		switch part
	    {
	        case 0:
	            draw_surface_part(aizen.fossil_surface,xx,yy,40,40,x,y) break;
	        case 1: case 2: case 3: case 4:
	            draw_surface_part(aizen.fossil_surface,xx,yy,20,20,x,y) break;
	        default:
	            show_error("switch 'part' undefined value when drawing",true) break;
    
	    }
	}*/
}
