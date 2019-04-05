/// @description Imminent water

if !instance_exists(wave)
{
    if instance_exists(freakyfishtime)
        instance_create(0,freakyfishtime.y,wave)
    else
        instance_create(0,room_height,wave)    
}
else
{
    alarm[6]=5
    exit        
}  

