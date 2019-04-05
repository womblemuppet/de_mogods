if MODE==1
{
    draw_set_colour(c_white)
    draw_rectangle(__view_get( e__VW.XView, 0 ),__view_get( e__VW.YView, 0 )+__view_get( e__VW.HView, 0 )-200,__view_get( e__VW.XView, 0 )+__view_get( e__VW.WView, 0 ),__view_get( e__VW.HView, 0 ),false)
    draw_set_colour(c_blue)
    var tx,ty;
    tx=__view_get( e__VW.XView, 0 )+30
    ty=__view_get( e__VW.YView, 0 )+__view_get( e__VW.HView, 0 )-170
    draw_text(tx,ty,string_hash_to_newline(dialogue_to_draw))
}


