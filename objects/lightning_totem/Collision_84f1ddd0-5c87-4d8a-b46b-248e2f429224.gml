if mode==1
{
    effect_create_above(ef_firework,x,y,2,c_yellow)
    instance_create(x,y,lightning_collectable)
    mode=2
    image_index=0
    image_speed=0.1
    dying=true
    sprite_index=lightning_extra_orb_despawn
}


