if cangroundpound==2
{
    if unique_ooga_gp_charges>0 && uniques_super_ooga_gp_enabled==true 
        attack_ooga_ultimate()
    cangroundpound=3
    var d;
    d=other.id
    with flower
    {
        if owner==d
        {
            //show_message("hit")
            cooldown=25
            samepersoncooldown=70
            owner=-1
            vspd=-24
            y-=4
            timer=TIMERSTARTNUMBER
            shake=0
            sprite_index=pineapple_fall
        }
    }

    with other
    {
        get_stunned(GROUND_POUND_STUN_AMOUNT,true)

    }
    vspd=-2.5
    if image_xscale==1
        hspd=4
    if image_xscale==-1
        hspd=-4
    
}

