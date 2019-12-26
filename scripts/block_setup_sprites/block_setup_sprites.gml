//exclude blocks that don't split
if object_index==weaksand
    exit


///grab the sprite list of the chunk currently being used
sprite_list=aizen.chunkery_sprite_list[? chunk_name_at_spawn_time]


//var left,right,up,down; [finaledit] swap back to vars when not debugging
left=false
right=false
up=false
down=false

if position_meeting(x+aizen.bw,y,block)
    right=true    
if position_meeting(x,y-aizen.bh,block)
    up=true
if position_meeting(x-aizen.bw,y,block)
    left=true
if position_meeting(x,y+aizen.bh,block)
    down=true   
    
if (left && right)
{
    if up
    {
        if down
            num=variant //5 or 17, chosen at block spawn
        else
            num=8
    }
    else
        num=2            
}
if (left && !right)
{
    if up
    {
        if down
            num=6
        else
            num=9
    }
    else
        num=3            
}
if (!left && right)
{
    if up
    {
        if down
            num=4
        else
            num=7
    }
    else
        num=1       
}
    
if (!left && !right)
    num=10
if (!up && !down)
    num=11
    
if (!left && !right && !down)
    num=15
if (!left && !right && !up)
    num=13
if (!right && !up && !down)
    num=14
if (!left && !up && !down)
    num=12
            
if (!left && !right && !up && !down)
    num=16


sprite_index=ds_list_find_value(sprite_list,num)
die_hit_sprite=sprite_list[| 18]
die_pushed_sprite=sprite_list[| 19]
die_disintegrated_sprite=sprite_list[| 20]
die_debris_sprite=sprite_list[| 21]
die_debris_sprite_die=sprite_list[| 22]
mask_index=block_mask75



