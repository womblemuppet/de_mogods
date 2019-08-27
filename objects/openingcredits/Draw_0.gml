draw_set_halign(fa_center)
draw_set_colour(c_white)

draw_sprite_ext(logo_spr,0,room_width/2,room_height/2-220,2,2,0,c_dkgray,0.25)

var linegap;
linegap=28

draw_set_font(font_openingcredits_big)
draw_text_colour(room_width/2,room_height/2-150,string_hash_to_newline(string_copy(text[0],0,textpos[0])),c_silver,c_silver,c_white,c_white,min(1,0.05*textpos[0]))


draw_set_font(font_openingcredits)
for (var i=1; i<NUMBEROFLINES; i+=1)
{
    draw_text_colour(room_width/2,room_height/2-120+i*linegap,string_hash_to_newline(string_copy(text[i],0,textpos[i])),c_white,c_white,c_white,c_white,min(1,0.05*textpos[i]))
};





draw_set_alpha(0.04) ///visible.
draw_set_font(font_cpr)
draw_set_colour(c_white)
draw_text(room_width-340,room_height-30,string_hash_to_newline("© jeremy wood pobelt 'okinawanshirt'"))
draw_set_alpha(1)

