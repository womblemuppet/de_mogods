/***************************************************
  losehp(gets around coconuke invuln,lastdamagetype)
 ***************************************************/
var me,safe;
me=self.id
safe=false

cars2=argument0
lastdamagetype=argument1

/*
///invuln
//    [finaledit] delete if  pufferfish no longer does this VV
if argument0==false
{
    with coco
    {
        if owner==me    //// VV   
            safe=false  ////TRUE
    }
}  ///////////////////////// ^^^
*/

if safe
{
    var a;
    a=instance_create(x,y,ef_stunspiral)
    a.sprite_index=nuke_shield_ef
    a.image_speed=0.2
    a.offsetx=0
    a.offsety=0
    a.targ=self.id
}
if immune==false && safe==false
{                                                                              //////////////take damage ///////////////////////////////////////////////////////////
    alarm[4]=80    ///flashing time
    immune=true
    hothands=0
    H-=1
    player_flinch()
    if H==3
        aizen.playerhpglow[P]=hud_floatingoogamask_glow
    if H==2
        aizen.playerhpglow[P]=hud_floatingoogamask_glowy
    if H==1
        aizen.playerhpglow[P]=hud_floatingoogamask_glowr


    if H<1
    {
        playerdie()
    }
    
}
