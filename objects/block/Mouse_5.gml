
//[finaledit]
show_message(string(id)+" "+sprite_get_name(sprite_index))

if position_meeting(x+40,y,block) 
    show_message("should be right")
//if position_meeting(x+20,y,block) 
//show_message("21 passes")
//if position_meeting(x+22,y,block) 
//show_message("22 passes")
//if position_meeting(x+30,y,block) 
//show_message("30 passes")
//if position_meeting(x+40,y,block) 
//show_message("40 passes")
show_message("right="+string(right))

if position_meeting(x,y-40,block) 
    show_message("should be up")
show_message("up="+string(up))

if position_meeting(x-40,y,block) 
    show_message("should be left")
show_message("left="+string(left))

if position_meeting(x,y+40,block) 
    show_message("should be down")
//if place_meeting(x,y+20,block) 
//    show_message("should be down 20")
//if place_meeting(x,y+30,block) 
//    show_message("should be down 30")
//if place_meeting(x,y+40,block) 
//    show_message("should be down 40")
show_message("down="+string(down))

//show_message("blockbiome= "+string(blockbiome))
//show_message("sprite list= "+string(sprite_list))
//show_message("sprite= "+string(sprite_index))


