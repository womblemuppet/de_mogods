////// fill in border views 
draw_set_colour(c_black)//( make_colour_hsv(24,130,145) )
//draw_rectangle(0,0,kouchou.room_left_border_x,room_height,false)      ///// view 1   (left hud)
//draw_rectangle(kouchou.room_right_border_x,0,kouchou.room_right_full,room_height,false)   /////  view 2 (right hud)
draw_rectangle(kouchou.room_left_border_x,0,kouchou.room_right_border_x,kouchou.room_top_border_y,false)  /// view 3 (top)
//draw_rectangle(kouchou.room_left_border_x,kouchou.room_bottom_border_y,kouchou.room_right_border_x,room_height,false)  /// view 4 (bottom)
