draw_set_alpha(min(1,myalpha))
draw_set_font(font_debug)
draw_set_colour(c_white)
draw_set_halign(fa_left)
draw_text(55,10,string_hash_to_newline(text))
draw_set_alpha(1)
myalpha-=0.1
if myalpha<0.1
    instance_destroy()

