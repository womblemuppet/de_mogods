if mode==0
{
    draw_set_alpha(0.2)
    draw_set_colour(c_red)
    draw_rectangle(kouchou.room_left_border_x,kouchou.room_top_border_y,kouchou.rw,kouchou.rh,false)    
    draw_set_alpha(1)
}
if mode==1
{
    draw_set_alpha(0.9)
    gpu_set_blendmode_ext(bm_dest_colour,bm_one)
    draw_set_colour(c_purple)
    draw_rectangle(kouchou.room_left_border_x,kouchou.room_top_border_y,kouchou.rw,kouchou.rh,false)
    gpu_set_blendmode(bm_normal)
}


