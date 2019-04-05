/***************************************************
  draw_blocks_and_fossils()
  call only once
****************************************************/
var xx,yy;
with block
{   
    if divisible //terrain_special_block_draw_ok()
    { 
        xx=x-__view_get( e__VW.XView, 0 )+aizen.screenshake_amount*aizen.screenshake_D
        yy=y-__view_get( e__VW.YView, 0 )+aizen.surface_redraw_counter      
        
        switch part
        {
            case 0:
                draw_surface_part(aizen.fossil_surface,xx,yy,40,40,x,y) break;
            case 1: case 2: case 3: case 4:
                draw_surface_part(aizen.fossil_surface,xx,yy,20,20,x,y) break;
            default:
                show_error("switch 'part' undefined value when drawing",true) break;
    
        }
    }
}
