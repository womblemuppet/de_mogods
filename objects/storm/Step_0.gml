/// @description [finaledit] not very optimized
if mode==0 || mode==1
{
    var hy;
    hy=9999

    for (var i=0; i<instance_number(player); i+=1)
    {
        if instance_find(player,i).y<hy || ( instance_find(player,i).y==hy && aizen.player_priority==instance_find(player,i).P)
        {
            highest=instance_find(player,i)
            hy=instance_find(player,i).y
        }
    };
    if instance_exists(highest)
    {
        if mode==0
            x=highest.x
    }
    if instance_exists(target)
    {
        if mode==1 
        {
            x=target.x
            var a;
            a=instance_create(target.x+choose(-1,0,1),target.y,zapindicator)
            a.image_yscale=target.y/a.sprite_height
            a.image_xscale=choose(1,-1)   
        }
    }
}

if mode==0 && image_index>23
    image_index=0

storm_offset_x++
if storm_offset_x>STORM_TOP_LAYER_SPRITE_WIDTH
	storm_offset_x=0



/***************************************************
  0=highest competition
  1=chosen target, following
  2=stops following
  3=shot
 ***************************************************/

/* */
/*  */
