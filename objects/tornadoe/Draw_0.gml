draw_set_color(c_white)

draw_sprite(spiralpower_base,image_index,x,effect_line_y)

draw_line(x-WIDTH/2,y-TOTAL_HEIGHT,x-WIDTH/2,y)
draw_line(x+WIDTH/2,y-TOTAL_HEIGHT,x+WIDTH/2,y)

draw_line(x-WIDTH/2,effect_line_y,x-WIDTH/2,effect_line_y)