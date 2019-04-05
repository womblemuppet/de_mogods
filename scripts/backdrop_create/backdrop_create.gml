/***************************************************
  backdrop_create(start sprite,start y,fill sprite, total fill distance,end sprite)
 ***************************************************/

var a,prevspr,usualspriteheight;
prevspr=sprite_index
sprite_index=argument0

for (i=0; i<kouchou.rw/sprite_width; i+=1)
{
    a=instance_create(kouchou.room_left_border_x+i*sprite_width,argument1-sprite_height,ef_backdrop)
    a.sprite_index=argument0
};

sprite_index=argument2
for (ii=0; ii<argument3/sprite_height; ii+=1)
{
    for (i=0; i<kouchou.rw/sprite_width; i+=1)
    {
        a=instance_create(kouchou.room_left_border_x+i*sprite_width,argument1+ii*sprite_height,ef_backdrop)
        a.sprite_index=argument2
    };
};
usualspriteheight=sprite_height

sprite_index=argument4
for (i=0; i<kouchou.rw/sprite_width; i+=1)
{
    a=instance_create(kouchou.room_left_border_x+i*sprite_width,argument1+argument3/*+usualspriteheight*/,ef_backdrop)
    a.sprite_index=argument4
};


sprite_index=prevspr
