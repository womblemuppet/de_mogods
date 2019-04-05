if other.creator!=self.id && STUNNED2<1 && other.image_index<3 && other.hit[P]==false
{
    other.hit[P]=true
    get_stunned(GROUND_POUND_STUN_AMOUNT*2,false)
    sprite_index=sprites[14]
    vspd=-1
}

