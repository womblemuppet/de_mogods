if tousen.MODE==0
{
    ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    /////////////////////////key presses
    ////////////////////////
    if player_checkkey("right")
        p_move(0)
    if player_checkkey("up")
        p_move(1)
    if player_checkkey("left")
        p_move(2)
    if player_checkkey("down")
        p_move(3)
    
    /////////////// resets firstdown key (the first key pressed for when player is pushing 2+directional keys
    if !player_checkkey("left") && !player_checkkey("right") && !player_checkkey("up") && !player_checkkey("down")
        firstdown=-1
    ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    
        
    if timer!=-1  //timer for smudging movement
        timer++
    
    /////////////// walking
    if moveD==0 
    {
        repeat(Spd)
        { 
            if !place_meeting(x+1,y,OVERWORLD_SOLID)
                x+=1
        }
            sprite_index=avatar_walk_right
            image_speed=walkimagespeed
            ismoving=true
    }
    else if moveD==1
    {
        repeat(Spd)
        { 
            if !place_meeting(x,y-1,OVERWORLD_SOLID)
                y-=1
        }
            sprite_index=avatar_walk_up
            image_speed=walkimagespeed
            ismoving=true
    }
    else if moveD==2
    {
        repeat(Spd)
        { 
            if !place_meeting(x-1,y,OVERWORLD_SOLID)
                x-=1
        }
            sprite_index=avatar_walk_left
            image_speed=walkimagespeed
            ismoving=true
    }
    else if moveD==3
    {
        repeat(Spd)
        { 
            if !place_meeting(x,y+1,OVERWORLD_SOLID)
                y+=1
        }
            sprite_index=avatar_walk_down
            image_speed=walkimagespeed
            ismoving=true
    }
    if x mod 40 == 0 && y mod 40 ==0   //snapped
    {
        if (!player_checkkey("left") && !player_checkkey("right") && !player_checkkey("up") && !player_checkkey("down") ) && moveq==-1 
        {
            if moveD==0 
                sprite_index=avatar_idle_right
            else if moveD==1 
                sprite_index=avatar_idle_up
            else if moveD==2
                sprite_index=avatar_idle_left
            else if moveD==3
                sprite_index=avatar_idle_down
                
            image_speed=standimagespeed
            image_index=0
        }
        if ismoving
        {
            ismoving=false
            channelwarmup=0
        }
        moveD=-1
        timer=-1
        basex=x
        basey=y   
        //cantcancel=false
    
    }
}

