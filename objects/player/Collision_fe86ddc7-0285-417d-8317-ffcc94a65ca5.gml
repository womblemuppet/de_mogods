if other.hit==false && other.active==true
{
    losehp(true,"fire")
    repeat(5)
    effect_create_above(ef_firework,x,y-random(100),2,c_red)
    with other
    {
        if sprite_index==torchBLOO
            sprite_index=torchBLOO_dead
        if sprite_index=torch_sprite
            sprite_index=torch_sprite_dead
        active=false
        alarm[1]=460
    }
}

