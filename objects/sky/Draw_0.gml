if aizen.travelled<aizen.cavelevel
{
    horizon_1=horizon_1_start+(aizen.travelled/convergence)*(kouchou.rh-horizon_1_start)  
    horizon_2=horizon_2_start+(aizen.travelled/convergence)*(kouchou.rh-horizon_2_start)
    
    //draw sky gradient    
    draw_sprite_general(sky_placeholder,0,0,0,1080,1200,kouchou.room_left_border_x,kouchou.room_top_border_y,kouchou.rw/1080,horizon_1/1200,0,c_white,c_white,c_white,c_white,1)  //,topcol,topcol,botcol,botcol,1)
    //draw_rectangle_colour(0,0,room_width,horizon_1,topcol,topcol,botcol,botcol,false)
    //draw sea texture
    draw_sprite_stretched_ext(seatex,image_index,kouchou.room_left_border_x,horizon_1,kouchou.rw,horizon_2-horizon_1,c_white,1)
    //draw ground texture
    draw_sprite_stretched(groundtex2,0,kouchou.room_left_border_x,horizon_2,kouchou.rw,kouchou.room_top_border_y+kouchou.rh-horizon_2)
}
else
{
    draw_rectangle_colour(kouchou.room_left_border_x,kouchou.room_top_border_y,kouchou.room_right_border_x,kouchou.room_bottom_border_y,topcol,topcol,c_black,c_black,false)  //background fill behind cave backdrop
}



