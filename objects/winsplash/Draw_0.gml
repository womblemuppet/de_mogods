draw_sprite_ext(sprite_index,image_index,x,y,image_xscale,image_yscale,image_angle,image_blend,image_alpha)

if show_restart_option
{
    draw_set_halign(fa_center)
    draw_set_colour(c_black)
    draw_set_font(font_coins)
    draw_text(kouchou.room_x_halfway,kouchou.room_bottom_border_y-200,string_hash_to_newline("press [light attack] to restart"))
}


