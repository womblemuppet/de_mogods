//exclude blocks that don't split
if object_index==weaksand
    exit


///grab the sprite list of the chunk currently being used
sprite_list=aizen.chunkery_sprite_list[? chunk_name_at_spawn_time]


//var left,right,up,down;
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
            num=variant
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
mask_index=block_mask75



