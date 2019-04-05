
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

if part==0
{

    var s1,s2,s3,s4,s5,s6,s7,s8;
    s1=false
    s2=false
    s3=false
    s4=false
    s5=false
    s6=false
    s7=false
    s8=false


    num=0  ///permament

    if position_meeting(x+40,y+20,block)
        s1=true    
    if position_meeting(x+40,y,block)
        s2=true
    if position_meeting(x+20,y-20,block)
        s3=true
    if position_meeting(x,y-20,block)
        s4=true
    if position_meeting(x-20,y,block)
        s5=true
    if position_meeting(x-20,y+20,block)
        s6=true
    if position_meeting(x,y+40,block)
        s7=true
    if position_meeting(x+20,y+40,block)
        s8=true
    
    I[3]=0
    
    I[0]=1
    if s4==true
    {
        if s5==true
            I[0]=variant
        else
            I[0]=4
    }
    else if s5==true
    {
        I[0]=2
    }
    
    I[1]=3
    if s2==true
    {
        if s3==true
            I[1]=variant
        else
            I[1]=2
    }
    else if s3==true
    {
        I[1]=6
    }
    
    I[2]=7
    if s6==true
    {
        if s7==true
            I[2]=variant
        else
            I[2]=8
    }
    else if s7==true
    {
        I[2]=4
    }
    
    I[3]=9
    if s1==true
    {
        if s8==true
            I[3]=variant
        else
            I[3]=8
    }
    else if s8==true
    {
        I[3]=6
    }        
        
    for (i=0; i<4; i+=1)
    {
        I[i]=ds_list_find_value(sprite_list,I[i])   ///I[] now contains the sprites to be drawn, not the position number
    };    

    sprite_index=ds_list_find_value(sprite_list,0)   ///used for terrain destruction atm
    mask_index=block_mask40
}
else
{
    var left,right,up,down;
    left=false
    right=false
    up=false
    down=false

    if position_meeting(x+20,y,block)
        right=true    
    if position_meeting(x,y-20,block)
        up=true
    if position_meeting(x-20,y,block)
        left=true
    if position_meeting(x,y+20,block)
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
    mask_index=block_mask20
}



