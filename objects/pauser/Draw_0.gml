with (pauser) {
draw_surface(pause_screencap,0,0)


///black box
draw_set_alpha(0.75)
draw_set_colour(c_black)
draw_rectangle(xx,yy,xx+WIDTH,yy+HEIGHT,false)

////some more random rectangles for placeholder flair
draw_set_alpha(0.05)
draw_set_colour(c_lime)
draw_rectangle(xx+40,yy,x,yy+HEIGHT,false)
draw_set_colour(c_fuchsia)
draw_rectangle(x,yy,xx+WIDTH-175,yy+HEIGHT,false)
draw_set_alpha(1)



///general text
draw_set_font(font_pausemenu)
draw_set_colour(c_black)
draw_set_halign(fa_center)
draw_text(x,yy+20,string_hash_to_newline(string("PAUSED")))
draw_text(x,yy+150,string_hash_to_newline("Player "+string(pausescreen_requester+1)))
var menucontrolpromptyoffset;
menucontrolpromptyoffset=40  ///minus


draw_text(xx+WIDTH-700,yy+HEIGHT-menucontrolpromptyoffset,string_hash_to_newline("Select"))
draw_text(xx+WIDTH-500,yy+HEIGHT-menucontrolpromptyoffset,string_hash_to_newline("Back"))
draw_text(xx+WIDTH-300,yy+HEIGHT-menucontrolpromptyoffset,string_hash_to_newline("Unpause game"))

if gamepad
{
    draw_sprite(controllerprompt_ps4,0,xx+WIDTH-760,yy+HEIGHT-menucontrolpromptyoffset)
    draw_sprite(controllerprompt_ps4,1,xx+WIDTH-560,yy+HEIGHT-menucontrolpromptyoffset)
    draw_sprite(controllerprompt_ps4,2,xx+WIDTH-360,yy+HEIGHT-menucontrolpromptyoffset)
}
else
{
    draw_set_font(font_ingame_controls_prompt)
    draw_set_colour(c_white)
    if ds_map_find_value(kouchou.keybinding_map_array[pausescreen_requester],"controlsetup")==0 || ds_map_find_value(kouchou.keybinding_map_array[pausescreen_requester],"controlsetup")==1    ///[finaledit] hardcoded, shouldn't be
    {
        draw_text(xx+WIDTH-760,yy+HEIGHT-menucontrolpromptyoffset,string_hash_to_newline("V"))
        draw_text(xx+WIDTH-560,yy+HEIGHT-menucontrolpromptyoffset,string_hash_to_newline("B"))
        draw_text(xx+WIDTH-450,yy+HEIGHT-menucontrolpromptyoffset,string_hash_to_newline("Space"))
    }
    else
    {
        draw_text(xx+WIDTH-760,yy+HEIGHT-menucontrolpromptyoffset,string_hash_to_newline("."))
        draw_text(xx+WIDTH-560,yy+HEIGHT-menucontrolpromptyoffset,string_hash_to_newline("/"))
        draw_text(xx+WIDTH-450,yy+HEIGHT-menucontrolpromptyoffset,string_hash_to_newline("Enter"))
    }
}
draw_set_font(font_commandlist)
///main menu
if select!=10
{
    var my,highlightcolour,normiecolour,mlistygap;  //menu list start y
    my=yy+200
    highlightcolour=c_white
    normiecolour=c_black
    mlistygap=40
    
    for (i=0; i<SELECTMAX+1; i+=1)
    {
        if select==i
            draw_set_colour(highlightcolour)
        else
            draw_set_colour(normiecolour)
        draw_text(x,my+mlistygap*i,string_hash_to_newline(select_menu_text[i]))      
    };
}
else   ////command list
{
    draw_set_alpha(0.95)
    draw_set_halign(fa_left)
    var cxoffset,cy,highlightcolour,normiecolour,clistygap,clistbox_edge,attacknameyoffset,conditioncolour,conditionyoffset,properties_xoffset,properties_yoffset,properties_xgap;  //menu list start y
    cxoffset=140    ///text x offset from left border
    cy=yy+200       ///y position to start command list from
    
    highlightcolour=c_white   ///attack colours (selected/notselected)
    normiecolour=c_gray
    
    attacknameyoffset=20      //draws attack name y amount under box start
    
    conditioncolour=c_silver
    conditionyoffset=50  //condition is drawn y amount under attack name
    
    properties_xoffset=50 //distance from the right border
    properties_yoffset=12  //properties icons are drawn y amount under attack name
    properties_xgap=50
    
    clistygap=85    // increment amount of each box
    clistbox_edge=90 //distance of command list box from edge of menu borders
    clistbox_height=80
    
    for (i=0; i<ds_list_size(commands_list); i+=1)
    {
        if commandlist_select==i
            draw_set_colour(box_highlightcolour[commands_list_boxtype[| i]])
        else
            draw_set_colour(box_normiecolour[commands_list_boxtype[| i]])            
        draw_set_alpha(0.8)
        draw_rectangle(xx+clistbox_edge,cy+clistygap*i-10,xx+WIDTH-clistbox_edge,cy+clistygap*i+clistbox_height-10,false)
        
        draw_set_font(font_commandlist)         
        if commandlist_select==i
            draw_set_colour(highlightcolour)
        else
            draw_set_colour(normiecolour)
        draw_text(xx+cxoffset,cy+clistygap*i+attacknameyoffset,string_hash_to_newline(commands_list[| i]))      
        
        draw_set_font(font_commandlist_conditions)
        draw_set_alpha(1)
        draw_set_colour(conditioncolour)
        draw_text(xx+cxoffset,cy+clistygap*i+conditionyoffset,string_hash_to_newline(commands_list_conditions[| i]))     

        if commands_list_properties[| i]!=-1
            draw_sprite(spr_cmlist_status_effects,commands_list_properties[| i],xx+WIDTH-clistbox_edge-properties_xoffset-properties_xgap,cy+clistygap*i+properties_yoffset)
        if commands_list_properties2[| i]!=-1
            draw_sprite(spr_cmlist_status_effects,commands_list_properties2[| i],xx+WIDTH-clistbox_edge-properties_xoffset-properties_xgap-50,cy+clistygap*i+properties_yoffset)
    };
       
     
    draw_set_alpha(1)
}



}
