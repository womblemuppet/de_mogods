if recoil_sprite_counter>0
{
    sprite_index=sprites[25]  //recoiling
    if supers>0
        sprite_index=sprites[26]  //recoiling super
    exit
}
if !place_meeting(x,y+1,block)
{
    if vspd>FALLING_SPRITE_THRESHOLD_VSPD_LARGER_THAN
    {
        sprite_index=sprites[4]   //falldown sprite
        if supers>0
            sprite_index=sprites[12]
        image_speed=0.15
    }
    else
    {
        sprite_index=sprites[3]    //  air sprite
        if supers>0
            sprite_index=sprites[11]
    }
}
else
{
    sprite_index=sprites[0]  ///idle
    if supers>0
        sprite_index=sprites[9]
}
