var xx1,xx2;
xx1=x-WIDTH/2
xx2=x+WIDTH/2
draw_set_alpha(0.2)
//draw_set_blend_mode_ext(bm_dest_colour,bm_one)
draw_set_colour(c_white)
draw_rectangle(xx1,y,xx2,y-HEIGHT,false)
draw_triangle(xx1-1,y-SPLITDISTANCE,xx1-1,y-HEIGHT,xx1-GIRTH,y-HEIGHT,false)
draw_triangle(xx2,y-SPLITDISTANCE,xx2,y-HEIGHT,xx2+GIRTH,y-HEIGHT,false)

//draw_set_blend_mode(bm_normal)

if aizen.debug
    draw_self()

