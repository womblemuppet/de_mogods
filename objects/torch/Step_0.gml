if aizen.terraintype!="biomegap"   ///stops the torches falling until there's blocks under it
    grav(8)
if y>room_height+400
    vspd=0
if y>12000
{
    show_error("torch bottomless bug has occured",false)
    instance_destroy()
}
//if instance_exists(wave)    ///[finaledit] optimise! this is bad
//{
//    if wave.y<y
//    {
//        if sprite_index==torchBLOO
//            sprite_index=torchBLOO_dead
//        if sprite_index=torch_sprite
//            sprite_index=torch_sprite_dead
            
//        alarm[1]=60
//        active=false
//    }
//}


