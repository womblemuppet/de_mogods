var b;
b=create_terrain_cutter(sprite_index, "pushed", direction,6)
b.alarm[0]=1

life-=1
if life<1
    instance_destroy()

