if aizen.debug
{
    draw_set_colour(c_red)
    draw_line(0,y,room_width,y)
}

var surface_sprite,fill_sprite;
surface_sprite=waveline
fill_sprite=waterfill
if frozen
{
    surface_sprite=waveline_frozen
    fill_sprite=waterfill_frozen
}






for (i=(kouchou.room_left_border_x/sprite_width)-1; i<(kouchou.room_right_border_x-kouchou.room_left_border_x)/sprite_width; i+=1)
{
    draw_sprite_ext(surface_sprite,image_index,kouchou.room_left_border_x+i*sprite_width,y,1,1,0,c_white,image_alpha)
};


for (ii=0; ii<1+(ceil((kouchou.rh-y)/sprite_height)); ii+=1)
{          
    for (i=(kouchou.room_left_border_x/sprite_width)-1; i<(kouchou.room_right_border_x-kouchou.room_left_border_x)/sprite_width; i+=1)
    {
        draw_sprite_ext(fill_sprite,image_index,kouchou.room_left_border_x+i*sprite_width,sprite_height+y+ii*sprite_height,1,1,0,c_white,image_alpha)
    };      
};   


