if !frozen
{
    for (i=0; i<room_width/sprite_width; i+=1)
    {
        draw_sprite_ext(waveline,image_index,i*sprite_width,y,1,1,0,c_white,image_alpha)
    };
    for (ii=0; ii<1+(ceil((room_height-y)/sprite_height)); ii+=1)
    {
          
        for (i=0; i<room_width/sprite_width; i+=1)
        {
            draw_sprite_ext(waterfill,image_index,i*sprite_width,sprite_height+y+ii*sprite_height,1,1,0,c_white,image_alpha)
        };      
    };   
}
else
{
    for (i=0; i<room_width/sprite_width; i+=1)
    {
        draw_sprite_ext(waveline_frozen,0,i*sprite_width,y,1,1,0,c_white,image_alpha)
    };
    for (ii=0; ii<1+(ceil((room_height-y)/sprite_height)); ii+=1)
    {          
        for (i=0; i<room_width/sprite_width; i+=1)
        {
            draw_sprite_ext(waterfill_frozen,0,i*sprite_width,sprite_height+y+ii*sprite_height,1,1,0,c_white,image_alpha)
        };      
    };   
}

