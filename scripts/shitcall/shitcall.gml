/***************************************************
  shitcall(delay timer amount,kill orbs)
  stops additional orbs from being spawned, starts timer for first elemental effect, sets mode variable to 1
****************************************************/



with instrument
    protection+=999999
with ore_block
    protection+=999999
with meteor_block
    protection+=999999

screenshake(5,12)
if argument1
{
    with orbb
    {
        effect_create_above(ef_firework,x,y,0,c_fuchsia)
        instance_destroy()
    }
}
mode=1
alarm[1]=argument0


lightning_triple_combine=false //[finaledit] obsolete?
var n;
n=0
for (i=0; i<ds_list_size(STACK); i+=1)
{
    if STACK[| i]==2
        n+=1
//    else
//        n=0
    if n>2
    {
        lightning_triple_combine=true
        break;
    }
};

effect_create_above(ef_firework,room_width/2,room_height/2,2,c_red)
