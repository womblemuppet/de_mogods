draw_set_colour(c_white)
draw_set_font(font_coins)
draw_text(50,230,string_hash_to_newline(string(alarm[2])+"=alarm2"))
draw_text(50,330,string_hash_to_newline(string(ammo)+"=ammo"))
draw_text(room_width/2-50,50,string_hash_to_newline(string(round(timer/60))+"  remaining"))
draw_text(room_width/4-50,50,string_hash_to_newline("score "+string(aizen.scoer)))


