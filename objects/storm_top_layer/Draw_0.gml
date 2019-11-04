var STORM_TOP_LAYER_SPRITE_WIDTH;
STORM_TOP_LAYER_SPRITE_WIDTH=194

for (var i = -1; i < kouchou.rw/STORM_TOP_LAYER_SPRITE_WIDTH; i++) 
{
    draw_sprite(sprite_index,image_index,storm_top_layer_offset_x+i*STORM_TOP_LAYER_SPRITE_WIDTH,kouchou.room_top_border_y)
}
