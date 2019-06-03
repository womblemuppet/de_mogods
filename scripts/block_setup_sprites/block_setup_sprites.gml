
//exclude blocks that don't split
if object_index==ice_block
    exit
if object_index=ore_block
    exit
if object_index=meteor_block
    exit
if object_index==weaksand
    exit
if object_index==tree_block
    exit
if object_index==turret_block
    exit
if object_index==instrument
    exit


sprite_list=aizen.chunkery_sprite_list[? blockchunktype]


if object_index==gunpowder
	sprite_list=aizen.BLOCK_SPRITE_GUNNY_FULL

//var left,right,up,down;
left=false
right=false
up=false
down=false

if position_meeting(x+40,y,block)
    right=true    
if position_meeting(x,y-40,block)
    up=true
if position_meeting(x-40,y,block)
    left=true
if position_meeting(x,y+40,block)
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
mask_index=block_mask40




