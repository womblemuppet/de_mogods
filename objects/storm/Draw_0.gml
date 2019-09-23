draw_sprite_ext(sprite_index,image_index,x,y,image_xscale,image_yscale,image_angle,image_blend,image_alpha)

var STORM_TOP_LAYER_SPRITE_WIDTH;
STORM_TOP_LAYER_SPRITE_WIDTH=194

for (var i = -1; i < kouchou.rw/STORM_TOP_LAYER_SPRITE_WIDTH; i++) 
{
    draw_sprite(storm_top_layer_spr,0,storm_offset_x+i*STORM_TOP_LAYER_SPRITE_WIDTH,kouchou.room_top_border_y)
}